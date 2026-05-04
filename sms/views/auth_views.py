import logging
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views.decorators.http import require_POST
from sms.models import Student, Teacher

logger = logging.getLogger(__name__)


def _redirect_by_role(user):
    """Return a redirect response based on user role, or None if no match."""
    role = user.user_type
    if role == "ADMIN":
        return redirect('admin_home')
    elif role == "TEACHER":
        return redirect('teacher_home')
    elif role == "STUDENT":
        return redirect('student_home')
    return None


def home_page(request):
    if request.user.is_authenticated:
        response = _redirect_by_role(request.user)
        if response:
            return response
    return render(request, 'sms/home.html')


def login_page(request):
    if request.user.is_authenticated:
        response = _redirect_by_role(request.user)
        if response:
            return response
    return render(request, "sms/login.html")


@require_POST
def do_login(request):
    user_name = request.POST.get("username", "").strip()
    user_pass = request.POST.get("password", "")

    if not user_name or not user_pass:
        messages.error(request, "Username and password are required.")
        return HttpResponseRedirect(reverse("login_page"))

    authenticated_user = authenticate(request, username=user_name, password=user_pass)

    if authenticated_user is not None:
        login(request, authenticated_user)
        logger.info("User logged in: %s (Role: %s)", authenticated_user.username, authenticated_user.user_type)

        response = _redirect_by_role(authenticated_user)
        if response:
            return response

        messages.error(request, "Access Denied: Unrecognized User Type.")
        logout(request)
        return HttpResponseRedirect(reverse("login_page"))
    else:
        logger.warning("Failed login attempt for username: %s", user_name)
        messages.error(request, "Invalid username or password. Please try again.")
        return HttpResponseRedirect(reverse("login_page"))


def logout_user(request):
    logout(request)
    return HttpResponseRedirect(reverse("home"))


def error_404_view(request, exception):
    return render(request, 'sms/error_404.html', status=404)


def error_500_view(request):
    return render(request, 'sms/error_500.html', status=500)


def digital_id_view(request, unique_id):
    try:
        if unique_id.startswith('STU'):
            student_id = int(unique_id.replace('STU', ''))
            student = get_object_or_404(Student, id=student_id)
            context = {
                'type': 'Student',
                'name': student.user.get_full_name() or student.user.username,
                'department': student.course.name if student.course else 'N/A',
                'id_number': unique_id,
                'contact': student.user.phone or "N/A",
                'email': student.user.email,
                'valid_thru': "May 2027",
                'avatar': student.user.profile_pic.url if student.user.profile_pic else None,
                'is_active': student.user.is_active
            }
            return render(request, 'sms/digital_id_card.html', context)

        elif unique_id.startswith('TEA') or unique_id.startswith('FAC'):
            prefix = 'TEA' if unique_id.startswith('TEA') else 'FAC'
            teacher_id = int(unique_id.replace(prefix, ''))
            teacher = get_object_or_404(Teacher, id=teacher_id)
            context = {
                'type': 'Faculty',
                'name': teacher.user.get_full_name() or teacher.user.username,
                'department': teacher.department.name if teacher.department else "N/A",
                'id_number': unique_id,
                'contact': teacher.user.phone or "N/A",
                'email': teacher.user.email,
                'valid_thru': "May 2027",
                'avatar': teacher.user.profile_pic.url if teacher.user.profile_pic else None,
                'is_active': teacher.user.is_active
            }
            return render(request, 'sms/digital_id_card.html', context)

    except (ValueError, TypeError):
        logger.warning("Invalid digital ID requested: %s", unique_id)

    return render(request, 'sms/error_404.html', status=404)
