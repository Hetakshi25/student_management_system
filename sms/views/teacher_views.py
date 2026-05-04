import json
from django.shortcuts import render
from django.db import models
from django.contrib import messages
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.urls import reverse
from django.contrib import messages
from django.utils import timezone
from sms.models import CustomUser, Student, Teacher, Subject, Attendance, AttendanceReport, StudentResult, NotificationTeacher, NotificationStudent, LeaveReportTeacher, FeedbackTeacher, Department, Course, TeacherSalary, SalaryRequest, TeacherPlaceApplication

def teacher_home(request):
    subjects = Subject.objects.filter(teacher=request.user)
    subjects_count = subjects.count()
    
    # Students reachable by this teacher
    teacher_courses = subjects.values_list('course', flat=True).distinct()
    students_query = Student.objects.filter(course__in=teacher_courses).distinct()
    students_count = students_query.count()
    
    # Advanced: Performance Distribution (Today Only)
    perf_data = {"Excellent": 0, "Good": 0, "Average": 0, "At Risk": 0}
    from django.db.models import Avg, Count
    today = timezone.now().date()
    
    for student in students_query:
        # Calculate Average Grade (Historical)
        avg_grade = StudentResult.objects.filter(student=student).aggregate(avg=Avg('subject_exam_marks'))['avg'] or 0
        
        # Calculate Cumulative Attendance Rate
        att_total = AttendanceReport.objects.filter(student=student).count()
        att_present = AttendanceReport.objects.filter(student=student, status=True).count()
        att_rate = (att_present / att_total * 100) if att_total > 0 else 0
        
        # Categorize
        if avg_grade >= 80 and att_rate >= 80: perf_data["Excellent"] += 1
        elif avg_grade >= 60 or att_rate >= 70: perf_data["Good"] += 1
        elif avg_grade >= 40: perf_data["Average"] += 1
        else: perf_data["At Risk"] += 1


    # Subject-wise attendance distribution (Cumulative)
    subject_chart_labels = []
    subject_chart_data = []
    for sub in subjects:
        subject_chart_labels.append(sub.name)
        sub_att_total = AttendanceReport.objects.filter(attendance__subject=sub).count()
        sub_att_present = AttendanceReport.objects.filter(attendance__subject=sub, status=True).count()
        sub_rate = (sub_att_present / sub_att_total * 100) if sub_att_total > 0 else 0
        subject_chart_data.append(round(sub_rate, 1))


    # Fetch Teacher object
    try:
        teacher_obj = Teacher.objects.get(user=request.user)
    except Teacher.DoesNotExist:
        teacher_obj = None

    notifications = []
    if teacher_obj:
        notifications = NotificationTeacher.objects.filter(teacher=teacher_obj).order_by('-id')[:5]
    
    context = {
        "subjects_count": subjects_count,
        "students_count": students_count,
        "perf_data": perf_data,
        "perf_labels": list(perf_data.keys()),
        "perf_values": list(perf_data.values()),
        "subject_labels": subject_chart_labels,
        "subject_data": subject_chart_data,
        "notifications": notifications,
        "teacher": teacher_obj,
    }
    return render(request, "sms/teacher_template/home_content.html", context)

def teacher_take_attendance(request):
    subjects = Subject.objects.filter(teacher=request.user)
    return render(request, "sms/teacher_template/take_attendance.html", {"subjects": subjects})

def get_students(request):
    subject_id = request.POST.get("subject")
    subject = Subject.objects.get(id=subject_id)
    students = Student.objects.filter(course=subject.course)
    
    # Return JSON-like response or just render a small template
    return render(request, "sms/teacher_template/student_list_attendance.html", {"students": students})

def get_students_json(request):
    subject_id = request.POST.get("subject")
    subject = Subject.objects.get(id=subject_id)
    students = Student.objects.filter(course=subject.course)
    student_list = []
    for student in students:
        student_list.append({"id": student.id, "name": student.user.get_full_name()})
    return JsonResponse(student_list, safe=False)

def get_students_result(request):
    subject_id = request.POST.get("subject")
    subject = Subject.objects.get(id=subject_id)
    students = Student.objects.filter(course=subject.course)
    return render(request, "sms/teacher_template/student_list_result.html", {"students": students})

def save_attendance_data(request):
    student_data = request.POST.get("student_ids")
    attendance_date = request.POST.get("attendance_date")
    subject_id = request.POST.get("subject_id")
    
    try:
        student_data_json = json.loads(student_data)
        subject_obj = Subject.objects.get(id=subject_id)
        attendance = Attendance.objects.create(subject=subject_obj, attendance_date=attendance_date)
        
        for stud in student_data_json:
            student_obj = Student.objects.get(id=stud['id'])
            AttendanceReport.objects.create(student=student_obj, attendance=attendance, status=stud['status'])
            print(f"[LOG] Attendance recorded for {student_obj.user.username} | Status: {'Present' if stud['status'] else 'Absent'}")
            
            # Persistent notification for Student
            status_text = "Present" if stud['status'] else "Absent"
            NotificationStudent.objects.create(
                student=student_obj,
                message=f"Attendance Update: You were marked as {status_text} for {subject_obj.name} on {attendance_date}."
            )
            
        # Persistent notification for Teacher
        teacher_obj = Teacher.objects.get(user=request.user)
        now = timezone.now().strftime('%H:%M %p')
        NotificationTeacher.objects.create(
            teacher=teacher_obj,
            message=f"System Log: Attendance for {subject_obj.name} ({attendance_date}) recorded at {now}."
        )
        
        # UI Feedback
        messages.success(request, f"Attendance for {subject_obj.name} on {attendance_date} recorded successfully.")
        
        return HttpResponse("OK")
    except Exception as e:
        print(f"Error saving attendance: {e}")
        return HttpResponse("Error")

def teacher_add_result(request):
    subjects = Subject.objects.filter(teacher=request.user)
    return render(request, "sms/teacher_template/add_result.html", {"subjects": subjects})

def save_student_result(request):
    if request.method != "POST":
        return HttpResponse("Method Not Allowed")
    else:
        student_ids = request.POST.get("student_ids")
        assignment_marks = request.POST.get("assignment_marks")
        exam_marks = request.POST.get("exam_marks")
        subject_id = request.POST.get("subject_id")

        try:
            student_ids = json.loads(student_ids)
            assignment_marks = json.loads(assignment_marks)
            exam_marks = json.loads(exam_marks)
            subject = Subject.objects.get(id=subject_id)

            for i, student_id in enumerate(student_ids):
                student = Student.objects.get(id=student_id)
                a_mark = assignment_marks[i]
                e_mark = exam_marks[i]
                
                # Check for empty strings and Convert to float, default to 0
                if a_mark == "": a_mark = 0
                else: a_mark = float(a_mark)
                
                if e_mark == "": e_mark = 0
                else: e_mark = float(e_mark)

                check_exists = StudentResult.objects.filter(student=student, subject=subject).exists()
                if check_exists:
                    result = StudentResult.objects.get(student=student, subject=subject)
                    result.subject_assignment_marks = a_mark
                    result.subject_exam_marks = e_mark
                    result.save()
                else:
                    result = StudentResult(student=student, subject=subject, subject_assignment_marks=a_mark, subject_exam_marks=e_mark)
                    result.save()
            return HttpResponse("OK")
        except Exception as e:
            print(f"Error Saving Result: {e}")
            return HttpResponse("Error")

def teacher_view_notification(request):
    teacher_obj = Teacher.objects.get(user=request.user)
    notifications = NotificationTeacher.objects.filter(teacher=teacher_obj).order_by("-id")
    return render(request, "sms/teacher_template/teacher_view_notification.html", {"notifications": notifications})

def teacher_profile(request):
    user = CustomUser.objects.get(id=request.user.id)
    departments = Department.objects.all()
    return render(request, "sms/teacher_template/teacher_profile.html", {"user": user, "departments": departments})

def teacher_salary_details(request):
    teacher = Teacher.objects.get(user=request.user)
    salaries = TeacherSalary.objects.filter(teacher=teacher).order_by('-payment_date')
    salary_requests = SalaryRequest.objects.filter(teacher=teacher).order_by('-id')
    return render(request, "sms/teacher_template/teacher_salary_details.html", {"salaries": salaries, "salary_requests": salary_requests})

def teacher_request_salary_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("teacher_salary_details"))
    else:
        amount = request.POST.get("amount")
        message = request.POST.get("message")
        teacher = Teacher.objects.get(user=request.user)
        try:
            SalaryRequest.objects.create(teacher=teacher, requested_amount=amount, request_message=message)
            messages.success(request, "Salary Request Sent Successfully")
        except:
            messages.error(request, "Failed to Send Salary Request")
        return HttpResponseRedirect(reverse("teacher_salary_details"))

def teacher_profile_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("teacher_profile"))
    else:
        first_name = request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        email = request.POST.get("email")
        password = request.POST.get("password")
        address = request.POST.get("address")
        phone = request.POST.get("phone")
        department_id = request.POST.get("department")
        
        # Validation: Names should contain only alphabets
        if not first_name.isalpha() or not last_name.isalpha():
            messages.error(request, "Error: Name fields (First/Last) must only contain alphabets (A-Z).")
            return HttpResponseRedirect(reverse("teacher_profile"))
        
        # Validation: Phone should contain only numbers and be 10 digits
        if phone and (not phone.isdigit() or len(phone) != 10):
            messages.error(request, "Error: Phone number must contain exactly 10 digits. No alphabets or special characters allowed.")
            return HttpResponseRedirect(reverse("teacher_profile"))

        try:
            user = CustomUser.objects.get(id=request.user.id)
            user.first_name = first_name
            user.last_name = last_name
            user.email = email
            user.phone = phone
            if password != None and password != "":
                user.set_password(password)
            user.save()
            
            teacher = Teacher.objects.get(user=user)
            teacher.address = address
            if department_id:
                dept_obj = Department.objects.get(id=department_id)
                teacher.department = dept_obj
            teacher.save()
            
            messages.success(request, "Profile Updated Successfully")
            return HttpResponseRedirect(reverse("teacher_profile"))
        except:
            messages.error(request, "Failed to Update Profile")
            return HttpResponseRedirect(reverse("teacher_profile"))

def teacher_feedback(request):
    teacher = Teacher.objects.get(user=request.user)
    feedback_data = FeedbackTeacher.objects.filter(teacher=teacher)
    return render(request, "sms/teacher_template/teacher_feedback.html", {"feedback_data": feedback_data})

def teacher_feedback_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("teacher_feedback"))
    else:
        feedback = request.POST.get("feedback_message")
        teacher = Teacher.objects.get(user=request.user)
        try:
            feedback_obj = FeedbackTeacher(teacher=teacher, feedback=feedback, feedback_reply="")
            feedback_obj.save()
            messages.success(request, "Feedback Sent Successfully")
            return HttpResponseRedirect(reverse("teacher_feedback"))
        except:
            messages.error(request, "Failed to Send Feedback")
            return HttpResponseRedirect(reverse("teacher_feedback"))

def teacher_apply_leave(request):
    teacher = Teacher.objects.get(user=request.user)
    leave_data = LeaveReportTeacher.objects.filter(teacher=teacher)
    return render(request, "sms/teacher_template/teacher_apply_leave.html", {"leave_data": leave_data})

def teacher_apply_leave_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("teacher_apply_leave"))
    else:
        leave_date = request.POST.get("leave_date")
        leave_message = request.POST.get("leave_message")
        teacher = Teacher.objects.get(user=request.user)
        try:
            leave_report = LeaveReportTeacher(teacher=teacher, leave_date=leave_date, leave_message=leave_message, leave_status=0)
            leave_report.save()
            messages.success(request, "Leave Applied Successfully")
            return HttpResponseRedirect(reverse("teacher_apply_leave"))
        except:
            messages.error(request, "Failed to Apply Leave")
            return HttpResponseRedirect(reverse("teacher_apply_leave"))

def teacher_edit_leave(request, leave_id):
    leave = LeaveReportTeacher.objects.get(id=leave_id)
    return render(request, "sms/teacher_template/edit_teacher_leave.html", {"leave": leave})

def teacher_edit_leave_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("teacher_apply_leave"))
    else:
        leave_id = request.POST.get("leave_id")
        leave_date = request.POST.get("leave_date")
        leave_message = request.POST.get("leave_message")
        try:
            leave = LeaveReportTeacher.objects.get(id=leave_id)
            leave.leave_date = leave_date
            leave.leave_message = leave_message
            leave.save()
            messages.success(request, "Leave Updated Successfully")
            return HttpResponseRedirect(reverse("teacher_apply_leave"))
        except:
            messages.error(request, "Failed to Update Leave")
            return HttpResponseRedirect(reverse("teacher_apply_leave"))

def teacher_delete_leave(request, leave_id):
    leave = LeaveReportTeacher.objects.get(id=leave_id)
    try:
        if leave.leave_status == 0:
            leave.delete()
            messages.success(request, "Leave Deleted Successfully")
        else:
            messages.error(request, "Processed leave cannot be deleted")
    except:
        messages.error(request, "Failed to Delete Leave")
    return HttpResponseRedirect(reverse("teacher_apply_leave"))

def teacher_view_department(request):
    departments = Department.objects.all()
    return render(request, "sms/teacher_template/view_department.html", {"departments": departments})

def teacher_view_course(request):
    courses = Course.objects.all()
    return render(request, "sms/teacher_template/view_course.html", {"courses": courses})

def teacher_view_student(request):
    from django.db.models import Avg, Count, Q
    subjects = Subject.objects.filter(teacher=request.user)
    courses = subjects.values_list('course', flat=True)
    students = Student.objects.filter(course__in=courses).select_related('user', 'course').distinct()
    
    # Handle search and filtering
    query = request.GET.get('q')
    course_id = request.GET.get('course')
    
    if query:
        students = students.filter(
            Q(user__first_name__icontains=query) | 
            Q(user__last_name__icontains=query) |
            Q(user__username__icontains=query) |
            Q(user__email__icontains=query)
        )
    
    if course_id:
        students = students.filter(course_id=course_id)
        
    student_data = []
    for student in students:
        # 1. Attendance "Tendency"
        reports = AttendanceReport.objects.filter(student=student)
        total_att = reports.count()
        present_att = reports.filter(status=True).count()
        att_rate = (present_att / total_att * 100) if total_att > 0 else 0
        
        # 2. Performance "Tendency"
        results = StudentResult.objects.filter(student=student)
        avg_marks = results.aggregate(Avg('subject_exam_marks'))['subject_exam_marks__avg'] or 0
        
        # Tendency Label based on combined metrics
        tendency = "Average"
        status_color = "warning"
        if att_rate > 85 and avg_marks > 75:
            tendency = "Excellent"
            status_color = "success"
        elif att_rate < 50 or avg_marks < 40:
            tendency = "At Risk"
            status_color = "danger"
        elif att_rate > 70:
            tendency = "Improving"
            status_color = "info"
            
        student_data.append({
            "student": student,
            "att_rate": round(att_rate, 1),
            "avg_marks": round(avg_marks, 1),
            "tendency": tendency,
            "status_color": status_color
        })
        
    context = {
        "students_data": student_data,
        "courses": Course.objects.filter(id__in=courses),
        "query": query,
        "course_filter": course_id,
        "active_page": "students"
    }
    return render(request, "sms/teacher_template/view_student.html", context)


def teacher_apply_place(request):
    teacher = Teacher.objects.get(user=request.user)
    applications = TeacherPlaceApplication.objects.filter(teacher=teacher)
    return render(request, "sms/teacher_template/teacher_apply_place.html", {"applications": applications})

def teacher_apply_place_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("teacher_apply_place"))
    else:
        place_name = request.POST.get("place_name")
        application_date = request.POST.get("application_date")
        reasons = request.POST.get("reasons")
        teacher = Teacher.objects.get(user=request.user)
        try:
            TeacherPlaceApplication.objects.create(
                teacher=teacher, 
                place_name=place_name, 
                application_date=application_date, 
                reasons=reasons
            )
            messages.success(request, "Application Sent Successfully")
        except:
            messages.error(request, "Failed to Send Application")
        return HttpResponseRedirect(reverse("teacher_apply_place"))


