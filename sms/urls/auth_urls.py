from django.urls import path
from sms.views import auth_views

urlpatterns = [
    path('', auth_views.home_page, name="home"),
    path('login/', auth_views.login_page, name="login_page"),
    path('do_login/', auth_views.do_login, name="do_login"),
    path('logout/', auth_views.logout_user, name="logout"),
    path('id/<str:unique_id>/', auth_views.digital_id_view, name="digital_id_view"),
]
