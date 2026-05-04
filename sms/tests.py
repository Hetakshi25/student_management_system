from django.test import TestCase, Client
from django.urls import reverse
from sms.models import CustomUser, Course, Teacher, Student, Subject

class SMSTests(TestCase):
    def setUp(self):
        self.client = Client()
        # Create Admin
        self.admin_user = CustomUser.objects.create_superuser(
            username='admin_test', email='admin@test.com', password='password123'
        )
        self.admin_user.user_type = 'ADMIN'
        self.admin_user.save()

        # Create Course
        self.course = Course.objects.create(name="BCA")

        # Create Teacher
        self.teacher_user = CustomUser.objects.create_user(
            username='teacher_test', email='teacher@test.com', password='password123'
        )
        self.teacher_user.user_type = 'TEACHER'
        self.teacher_user.save()
        self.teacher_profile = Teacher.objects.create(user=self.teacher_user, address="Test Address")

        # Create Student
        self.student_user = CustomUser.objects.create_user(
            username='student_test', email='student@test.com', password='password123'
        )
        self.student_user.user_type = 'STUDENT'
        self.student_user.save()
        self.student_profile = Student.objects.create(user=self.student_user, course=self.course, gender="Male", address="Test Rd")

    def test_login_page_loads(self):
        response = self.client.get(reverse('login_page'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Login")

    def test_admin_dashboard_access(self):
        # Login
        login = self.client.login(username='admin_test', password='password123')
        self.assertTrue(login)
        
        response = self.client.get(reverse('admin_home'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Admin Dashboard Overview")
        # Check if charts are in the response
        self.assertContains(response, "courseChart")
        self.assertContains(response, "ratioChart")
        # Check if sidebar template is used (verify label from previous task)
        self.assertContains(response, "SMS VANGUARD")

    def test_teacher_dashboard_access(self):
        login = self.client.login(username='teacher_test', password='password123')
        self.assertTrue(login)
        
        response = self.client.get(reverse('teacher_home'))
        self.assertEqual(response.status_code, 200)
        # Assuming teacher_home has some specific text
        self.assertContains(response, "Teacher Dashboard")

    def test_student_dashboard_access(self):
        login = self.client.login(username='student_test', password='password123')
        self.assertTrue(login)
        
        response = self.client.get(reverse('student_home'))
        self.assertEqual(response.status_code, 200)
        # Assuming student_home has some specific text
        self.assertContains(response, "Student Dashboard")

    def test_sidebar_consistency(self):
        # Admin Profile page sidebar
        self.client.login(username='admin_test', password='password123')
        response = self.client.get(reverse('admin_profile'))
        self.assertEqual(response.status_code, 200)
        # Check for sidebar links that should be present due to include
        self.assertContains(response, "Attendance Report")
        self.assertContains(response, "Result Report")
