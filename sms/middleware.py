from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect

# Public paths that don't require authentication
PUBLIC_PATHS = ('/', '/login/', '/do_login/')

class LoginCheckMiddleWare(MiddlewareMixin):
    def process_view(self, request, view_func, view_args, view_kwargs):
        path = request.path

        # Allow public pages, static/media files, digital ID, and django admin
        if (path in PUBLIC_PATHS or
                path.startswith('/static/') or
                path.startswith('/media/') or
                path.startswith('/id/') or
                path.startswith('/django-admin/')):
            return None

        # Redirect unauthenticated users to login
        if not request.user.is_authenticated:
            return redirect('login_page')

        # Role-based access control
        user_type = request.user.user_type
        module = view_func.__module__

        if user_type == "STUDENT" and "admin_views" in module:
            return redirect('student_home')
        if user_type == "STUDENT" and "teacher_views" in module:
            return redirect('student_home')
        if user_type == "TEACHER" and "admin_views" in module:
            return redirect('teacher_home')
        if user_type == "ADMIN" and "student_views" in module:
            return redirect('admin_home')
        if user_type == "ADMIN" and "teacher_views" in module:
            return redirect('admin_home')

        return None
