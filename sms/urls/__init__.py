from django.urls import path, include

urlpatterns = [
    # Authentication
    path('', include('sms.urls.auth_urls')),
    
    # Admin
    path('', include('sms.urls.admin_urls')),
    
    # Teacher
    path('', include('sms.urls.teacher_urls')),
    
    # Student
    path('', include('sms.urls.student_urls')),
]
