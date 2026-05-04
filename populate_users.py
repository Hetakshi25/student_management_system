import os
import django

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'student_management.settings')
django.setup()

from sms.models import CustomUser, Department, Course, Teacher, Student

def populate_sample_data():
    # 1. Create Admin
    if not CustomUser.objects.filter(email='admin@sms.com').exists():
        admin_user = CustomUser.objects.create_superuser(
            username='admin',
            email='admin@sms.com',
            password='admin',
            user_type='ADMIN'
        )
        print("Created Admin: admin@sms.com / admin")
    else:
        print("Admin already exists.")

    # 2. Create Department
    dept, created = Department.objects.get_or_create(name='Computer Science')
    if created:
        print(f"Created Department: {dept.name}")

    # 3. Create Course
    course, created = Course.objects.get_or_create(name='B.Tech CSE', department=dept, fee=50000)
    if created:
        print(f"Created Course: {course.name}")

    # 4. Create Teacher
    if not CustomUser.objects.filter(email='teacher@sms.com').exists():
        teacher_user = CustomUser.objects.create_user(
            username='teacher',
            email='teacher@sms.com',
            password='teacher',
            user_type='TEACHER',
            first_name='John',
            last_name='Doe'
        )
        Teacher.objects.create(user=teacher_user, address='123 Teacher St', department=dept)
        print("Created Teacher: teacher@sms.com / teacher")
    else:
        print("Teacher already exists.")

    # 5. Create Student
    if not CustomUser.objects.filter(email='student@sms.com').exists():
        student_user = CustomUser.objects.create_user(
            username='student',
            email='student@sms.com',
            password='student',
            user_type='STUDENT',
            first_name='Jane',
            last_name='Smith'
        )
        Student.objects.create(user=student_user, address='456 Student Ave', course=course, gender='Female')
        print("Created Student: student@sms.com / student")
    else:
        print("Student already exists.")

if __name__ == '__main__':
    populate_sample_data()
