from django.contrib.auth.models import AbstractUser
from django.db import models

class CustomUser(AbstractUser):
    USER_TYPE_CHOICES = (
        ('ADMIN', 'Admin'),
        ('TEACHER', 'Teacher'),
        ('STUDENT', 'Student'),
    )
    user_type = models.CharField(max_length=10, choices=USER_TYPE_CHOICES, default='ADMIN')
    profile_pic = models.ImageField(upload_to='profile_pics/', null=True, blank=True)
    phone = models.CharField(max_length=15, null=True, blank=True)

class Department(models.Model):
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Course(models.Model):
    name = models.CharField(max_length=100)
    fee = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Subject(models.Model):
    name = models.CharField(max_length=100)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    teacher = models.ForeignKey(CustomUser, on_delete=models.CASCADE, limit_choices_to={'user_type': 'TEACHER'})
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Student(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    gender = models.CharField(max_length=10)
    address = models.TextField()
    course = models.ForeignKey(Course, on_delete=models.DO_NOTHING)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.user.get_full_name()

class Teacher(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    address = models.TextField()
    department = models.ForeignKey(Department, on_delete=models.CASCADE, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


    def __str__(self):
        return self.user.get_full_name()

class Attendance(models.Model):
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    attendance_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class AttendanceReport(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    attendance = models.ForeignKey(Attendance, on_delete=models.CASCADE)
    status = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class LeaveReportStudent(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    leave_date = models.CharField(max_length=255)
    leave_message = models.TextField()
    leave_status = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class NotificationStudent(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class NotificationTeacher(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class NotificationAdmin(models.Model):
    admin = models.ForeignKey(CustomUser, on_delete=models.CASCADE, limit_choices_to={'user_type': 'ADMIN'})
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class SystemSetting(models.Model):
    key = models.CharField(max_length=100, unique=True)
    value = models.TextField()
    description = models.CharField(max_length=255, blank=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.key}: {self.value[:30]}"

class LeaveReportTeacher(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    leave_date = models.CharField(max_length=255)
    leave_message = models.TextField()
    leave_status = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class FeedbackStudent(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    feedback = models.TextField()
    feedback_reply = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class FeedbackTeacher(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    feedback = models.TextField()
    feedback_reply = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class StudentResult(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    subject_exam_marks = models.FloatField(default=0)
    subject_assignment_marks = models.FloatField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class ExamSchedule(models.Model):
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    exam_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    room_number = models.CharField(max_length=50)
    venue = models.CharField(max_length=100, default='Main Hall')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.subject.name} - {self.exam_date}"


class StudentFee(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    fee_amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_date = models.DateField(auto_now_add=True)
    description = models.CharField(max_length=255, blank=True)
    status_choices = (
        ('Paid', 'Paid'),
        ('Pending', 'Pending'),
    )
    status = models.CharField(max_length=50, choices=status_choices, default='Paid')
    transaction_id = models.CharField(max_length=100, unique=True, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.student.user.first_name} - {self.fee_amount}"


class TeacherSalary(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    salary_amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_date = models.DateField(auto_now_add=True)
    description = models.CharField(max_length=255, blank=True)
    status_choices = (
        ('Paid', 'Paid'),
        ('Pending', 'Pending'),
    )
    status = models.CharField(max_length=50, choices=status_choices, default='Paid')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.teacher.user.first_name} - {self.salary_amount}"

class DailyLessonTarget(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    date = models.DateField()
    target_lessons = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        unique_together = ('teacher', 'date')

    def __str__(self):
        return f"{self.teacher.user.get_full_name()} - {self.date} - Target: {self.target_lessons}"

class SalaryRequest(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    requested_amount = models.DecimalField(max_digits=10, decimal_places=2)
    request_message = models.TextField()
    request_status = models.IntegerField(default=0) # 0: Pending, 1: Approved, 2: Rejected
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.teacher.user.first_name} - {self.requested_amount}"

class TeacherPlaceApplication(models.Model):
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    place_name = models.CharField(max_length=255) # E.g. Classroom 101, Lab A, etc.
    application_date = models.DateField()
    reasons = models.TextField()
    status_choices = (
        (0, 'Pending'),
        (1, 'Approved'),
        (2, 'Rejected'),
    )
    status = models.IntegerField(choices=status_choices, default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.teacher.user.get_full_name()} - {self.place_name}"

