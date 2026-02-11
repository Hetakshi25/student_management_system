from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.models import User
from .models import teacher

def teacher_signup(request):

    if request.method == "POST":
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        phone = request.POST.get('phone')
        subject = request.POST.get('subject')
        qualification = request.POST.get('qualification')

        if User.objects.filter(username=username).exists():
            messages.error(request, "Username already exists!")
            return redirect('teacher_signup')

        if User.objects.filter(email=email).exists():
            messages.error(request, "Email already registered!")
            return redirect('teacher_signup')

        user = User.objects.create_user(
            username=username,
            email=email,
            password=password
        )
        user.is_staff = True
        user.save()

        teacher.objects.create(
            user=user,
            phone=phone,
            subject=subject,
            qualification=qualification
        )

        messages.success(request, "Account created successfully!")
        return redirect('teacher_login')

    return render(request, 'signup.html')


def teacher_login(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None and user.is_staff:
            login(request, user)
            return redirect('teacher_dashboard')
        else:
            messages.error(request, "Invalid credentials or not a teacher")

    return render(request, 'login.html')


@login_required(login_url='teacher_login')
def teacher_dashboard(request):
    return render(request, 'dashboard.html')


def teacher_logout(request):
    logout(request)
    return redirect('teacher_login')
