from django.urls import path
from sms.views import teacher_views

urlpatterns = [
    path('teacher_home/', teacher_views.teacher_home, name="teacher_home"),
    path('teacher_take_attendance/', teacher_views.teacher_take_attendance, name="teacher_take_attendance"),
    path('get_students/', teacher_views.get_students, name="get_students"),
    path('get_students_json/', teacher_views.get_students_json, name="get_students_json"),
    path('save_attendance_data/', teacher_views.save_attendance_data, name="save_attendance_data"),
    path('teacher_add_result/', teacher_views.teacher_add_result, name="teacher_add_result"),
    path('save_student_result/', teacher_views.save_student_result, name="save_student_result"),
    path('get_students_result/', teacher_views.get_students_result, name="get_students_result"),
    path('teacher_view_notification/', teacher_views.teacher_view_notification, name="teacher_view_notification"),
    path('teacher_profile/', teacher_views.teacher_profile, name="teacher_profile"),
    path('teacher_profile_save/', teacher_views.teacher_profile_save, name="teacher_profile_save"),
    path('teacher_feedback/', teacher_views.teacher_feedback, name="teacher_feedback"),
    path('teacher_feedback_save/', teacher_views.teacher_feedback_save, name="teacher_feedback_save"),
    path('teacher_apply_leave/', teacher_views.teacher_apply_leave, name="teacher_apply_leave"),
    path('teacher_apply_leave_save/', teacher_views.teacher_apply_leave_save, name="teacher_apply_leave_save"),
    path('teacher_edit_leave/<leave_id>/', teacher_views.teacher_edit_leave, name="teacher_edit_leave"),
    path('teacher_edit_leave_save/', teacher_views.teacher_edit_leave_save, name="teacher_edit_leave_save"),
    path('teacher_delete_leave/<leave_id>/', teacher_views.teacher_delete_leave, name="teacher_delete_leave"),
    path('teacher_view_department/', teacher_views.teacher_view_department, name="teacher_view_department"),
    path('teacher_view_course/', teacher_views.teacher_view_course, name="teacher_view_course"),
    path('teacher_salary_details/', teacher_views.teacher_salary_details, name="teacher_salary_details"),
    path('teacher_request_salary_save/', teacher_views.teacher_request_salary_save, name="teacher_request_salary_save"),
    path('teacher_view_student/', teacher_views.teacher_view_student, name="teacher_view_student"),
    path('teacher_apply_place/', teacher_views.teacher_apply_place, name="teacher_apply_place"),
    path('teacher_apply_place_save/', teacher_views.teacher_apply_place_save, name="teacher_apply_place_save"),
]


