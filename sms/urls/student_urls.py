from django.urls import path
from sms.views import student_views

urlpatterns = [
    path('student_home/', student_views.student_home, name="student_home"),
    path('student_view_attendance/', student_views.student_view_attendance, name="student_view_attendance"),
    path('student_view_result/', student_views.student_view_result, name="student_view_result"),
    path('student_apply_leave/', student_views.student_apply_leave, name="student_apply_leave"),
    path('student_apply_leave_save/', student_views.student_apply_leave_save, name="student_apply_leave_save"),
    path('student_edit_leave/<leave_id>/', student_views.student_edit_leave, name="student_edit_leave"),
    path('student_edit_leave_save/', student_views.student_edit_leave_save, name="student_edit_leave_save"),
    path('student_delete_leave/<leave_id>/', student_views.student_delete_leave, name="student_delete_leave"),
    path('student_view_notification/', student_views.student_view_notification, name="student_view_notification"),
    path('student_profile/', student_views.student_profile, name="student_profile"),
    path('student_profile_save/', student_views.student_profile_save, name="student_profile_save"),
    path('student_feedback/', student_views.student_feedback, name="student_feedback"),
    path('student_feedback_save/', student_views.student_feedback_save, name="student_feedback_save"),
    path('student_pay_fee/', student_views.student_pay_fee, name="student_pay_fee"),
    path('student_pay_fee_save/', student_views.student_pay_fee_save, name="student_pay_fee_save"),
    path('student_fee_receipt/<fee_id>/', student_views.student_fee_receipt, name="student_fee_receipt"),
    path('student_view_transcript/', student_views.student_view_transcript, name="student_view_transcript"),
]
