from django.shortcuts import render
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.utils import timezone
from sms.models import Student, AttendanceReport, StudentResult, LeaveReportStudent, NotificationStudent, CustomUser, FeedbackStudent, StudentFee

def student_home(request):
    from django.db.models import Avg, Count
    student = Student.objects.get(user=request.user)
    
    # 1. Total Attendance Stats
    attendance_present = AttendanceReport.objects.filter(student=student, status=True).count()
    attendance_absent = AttendanceReport.objects.filter(student=student, status=False).count()
    total_attendance = attendance_present + attendance_absent
    attendance_percent = (attendance_present / total_attendance * 100) if total_attendance > 0 else 0
    
    # 2. Performance Data (Avg Grade)
    results = StudentResult.objects.filter(student=student)
    avg_marks = results.aggregate(avg=Avg('subject_exam_marks'))['avg'] or 0
    
    # 3. Subject-wise Performance Feed
    attendance_list = []
    # Fetch all subjects for the student's course
    from sms.models import Subject
    course_subjects = Subject.objects.filter(course=student.course).order_by('name')
    
    today = timezone.now().date()
    for sub in course_subjects:
        res = results.filter(subject=sub).first()
        marks = res.subject_exam_marks if res else None
        
        att_total = AttendanceReport.objects.filter(student=student, attendance__subject=sub).count()
        att_pres = AttendanceReport.objects.filter(student=student, attendance__subject=sub, status=True).count()
        sub_rate = (att_pres / att_total * 100) if att_total > 0 else 0
        
        attendance_list.append({
            'subject': sub.name,
            'attendance': round(sub_rate, 1),
            'marks': marks
        })

    context = {
        "student": student,
        "present_count": attendance_present,
        "absent_count": attendance_absent,
        "total_attendance": total_attendance,
        "attendance_percent": round(attendance_percent, 1),
        "avg_marks": round(avg_marks, 1),
        "attendance_list": attendance_list
    }
    return render(request, "sms/student_template/home_content.html", context)



def student_view_attendance(request):
    student = Student.objects.get(user=request.user)
    attendance_reports = AttendanceReport.objects.filter(student=student)
    return render(request, "sms/student_template/view_attendance.html", {"attendance_reports": attendance_reports})

def student_view_result(request):
    student = Student.objects.get(user=request.user)
    results = StudentResult.objects.filter(student=student)
    return render(request, "sms/student_template/view_result.html", {"results": results})

def student_apply_leave(request):
    student_obj = Student.objects.get(user=request.user)
    leave_data = LeaveReportStudent.objects.filter(student=student_obj)
    return render(request, "sms/student_template/student_apply_leave.html", {"leave_data": leave_data})

def student_apply_leave_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("student_apply_leave"))
    else:
        leave_date = request.POST.get("leave_date")
        leave_msg = request.POST.get("leave_msg")
        student_obj = Student.objects.get(user=request.user)
        try:
            leave_report = LeaveReportStudent(student=student_obj, leave_date=leave_date, leave_message=leave_msg, leave_status=0)
            leave_report.save()
            messages.success(request, "Successfully Applied for Leave")
            return HttpResponseRedirect(reverse("student_apply_leave"))
        except:
            messages.error(request, "Failed to Apply for Leave")
            return HttpResponseRedirect(reverse("student_apply_leave"))

def student_edit_leave(request, leave_id):
    leave = LeaveReportStudent.objects.get(id=leave_id)
    return render(request, "sms/student_template/edit_student_leave.html", {"leave": leave})

def student_edit_leave_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("student_apply_leave"))
    else:
        leave_id = request.POST.get("leave_id")
        leave_date = request.POST.get("leave_date")
        leave_msg = request.POST.get("leave_msg")
        try:
            leave = LeaveReportStudent.objects.get(id=leave_id)
            leave.leave_date = leave_date
            leave.leave_message = leave_msg
            leave.save()
            messages.success(request, "Leave Updated Successfully")
            return HttpResponseRedirect(reverse("student_apply_leave"))
        except:
            messages.error(request, "Failed to Update Leave")
            return HttpResponseRedirect(reverse("student_apply_leave"))

def student_delete_leave(request, leave_id):
    leave = LeaveReportStudent.objects.get(id=leave_id)
    try:
        if leave.leave_status == 0:
            leave.delete()
            messages.success(request, "Leave Deleted Successfully")
        else:
            messages.error(request, "Processed leave cannot be deleted")
    except:
        messages.error(request, "Failed to Delete Leave")
    return HttpResponseRedirect(reverse("student_apply_leave"))

def student_view_notification(request):
    student_obj = Student.objects.get(user=request.user)
    notifications = NotificationStudent.objects.filter(student=student_obj).order_by("-id")
    return render(request, "sms/student_template/student_view_notification.html", {"notifications": notifications})

def student_profile(request):
    user = CustomUser.objects.get(id=request.user.id)
    student = Student.objects.get(user=user)
    return render(request, "sms/student_template/student_profile.html", {"user": user, "student": student})

def student_profile_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("student_profile"))
    else:
        first_name = request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        email = request.POST.get("email")
        password = request.POST.get("password")
        address = request.POST.get("address")
        phone = request.POST.get("phone")
        
        # Validation: Names should contain only alphabets
        if not first_name.isalpha() or not last_name.isalpha():
            messages.error(request, "Error: Name fields (First/Last) must only contain alphabets (A-Z).")
            return HttpResponseRedirect(reverse("student_profile"))
        
        # Validation: Phone should contain only numbers and be 10 digits
        if phone and (not phone.isdigit() or len(phone) != 10):
            messages.error(request, "Error: Phone number must contain exactly 10 digits.")
            return HttpResponseRedirect(reverse("student_profile"))

        try:
            user = CustomUser.objects.get(id=request.user.id)
            user.first_name = first_name
            user.last_name = last_name
            user.email = email
            user.phone = phone
            if password != None and password != "":
                user.set_password(password)
            user.save()
            
            student = Student.objects.get(user=user)
            student.address = address
            student.save()
            
            messages.success(request, "Student Profile Updated Successfully")
            return HttpResponseRedirect(reverse("student_profile"))
        except Exception as e:
            messages.error(request, f"Failed to Update Profile: {e}")
            return HttpResponseRedirect(reverse("student_profile"))


def student_feedback(request):
    student = Student.objects.get(user=request.user)
    feedback_data = FeedbackStudent.objects.filter(student=student)
    return render(request, "sms/student_template/student_feedback.html", {"feedback_data": feedback_data})

def student_feedback_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("student_feedback"))
    else:
        feedback = request.POST.get("feedback_message")
        student = Student.objects.get(user=request.user)
        try:
            feedback_obj = FeedbackStudent(student=student, feedback=feedback, feedback_reply="")
            feedback_obj.save()
            messages.success(request, "Feedback Sent Successfully")
            return HttpResponseRedirect(reverse("student_feedback"))
        except:
            messages.error(request, "Failed to Send Feedback")
            return HttpResponseRedirect(reverse("student_feedback"))

def student_pay_fee(request):
    from sms.models import SystemSetting
    student = Student.objects.get(user=request.user)
    fee_amount = student.course.fee
    
    # Fetch dynamic payment settings
    upi_id = SystemSetting.objects.filter(key="school_upi_id").first()
    merchant_name = SystemSetting.objects.filter(key="school_merchant_name").first()
    
    # Fetch transaction history
    fee_history = StudentFee.objects.filter(student=student).order_by("-id")
    
    context = {
        "student": student,
        "fee_amount": fee_amount,
        "upi_id": upi_id.value if upi_id else "schoolfees@okicici",
        "merchant_name": merchant_name.value if merchant_name else "StudentManagementSystem",
        "fee_history": fee_history
    }
    return render(request, "sms/student_template/student_pay_fee.html", context)

def student_pay_fee_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("student_pay_fee"))
    else:
        amount = request.POST.get("amount")
        description = request.POST.get("description", "Online Fee Payment")
        transaction_id = request.POST.get("transaction_id")
        student = Student.objects.get(user=request.user)
        try:
            fee = StudentFee(
                student=student, 
                fee_amount=amount, 
                description=description, 
                status="Paid",
                transaction_id=transaction_id
            )
            fee.save()
            
            # Notification logic for "heavy" (high-value) fees
            if float(amount) >= 5000:
                from sms.models import NotificationAdmin, CustomUser
                admins = CustomUser.objects.filter(user_type='ADMIN')
                for admin in admins:
                    NotificationAdmin.objects.create(
                        admin=admin,
                        message=f"HEAVY PAYMENT ALERT: Student {student.user.get_full_name()} paid ₹{amount} (Receipt #PAY-{fee.id}). View in Fee Dashboard."
                    )
            
            messages.success(request, f"Fee of {amount} Paid Successfully")
            return HttpResponseRedirect(reverse("student_fee_receipt", kwargs={"fee_id": fee.id}))
        except Exception as e:
            messages.error(request, f"Failed to Process Payment: {e}")
            return HttpResponseRedirect(reverse("student_pay_fee"))

def student_view_transcript(request):
    """
    Generates an official-style academic transcript for the student.
    Includes calculated totals, GPA mock, and institutional watermarks.
    """
    from django.db.models import Avg
    student = Student.objects.get(user=request.user)
    results = StudentResult.objects.filter(student=student)
    
    # Calculate performance metrics
    avg_marks = results.aggregate(avg=Avg('subject_exam_marks'))['avg'] or 0
    mock_gpa = round((avg_marks / 100) * 10, 2)
    
    context = {
        "student": student,
        "results": results,
        "avg_marks": round(avg_marks, 1),
        "mock_gpa": mock_gpa,
        "current_date": timezone.now().date(),
        "certificate_id": f"SMS-TR-{student.id}-{timezone.now().year}"
    }
    return render(request, "sms/student_template/student_transcript.html", context)

def student_fee_receipt(request, fee_id):
    """
    Electronic Fee Receipt generation.
    """
    fee = StudentFee.objects.get(id=fee_id)
    student = Student.objects.get(user=request.user)
    
    # Security Check: Ensure student only views their own receipt
    if fee.student != student:
        messages.error(request, "Unauthorized access to receipt")
        return HttpResponseRedirect(reverse("student_home"))

    context = {
        "fee": fee,
        "student": student,
        "receipt_id": f"RCPT-{fee.id}-{fee.payment_date.strftime('%Y%m%d')}",
        "current_time": timezone.now()
    }
    return render(request, "sms/student_template/fee_receipt.html", context)
