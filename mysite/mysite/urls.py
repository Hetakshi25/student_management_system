"""
URL configuration for mysite project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/6.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mysite import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin-panel/', admin.site.urls),
    path('', views.homepage,name='home'),       
    path('about-us/',views.aboutus,name='about'),
    path('services/',views.services,name='services'),
    path('contact/',views.contact,name='contact'),
    path('userform/',views.userform,name='userform'),
    path('submitform/',views.submitform,name='submitform'),
    path('calculator/',views.calculator,name='calculator'),
    path('saveevenodd/',views.saveevenodd),
    path('marksheet/',views.marksheet),
    path('newsdetails/<slug>',views.newsdetails),
    path('saveenquiry/',views.saveEnquiry,name='saveenquiry'),
    #path('course/<slug:courseid>',views.courseDetails),
    #path('userform',views.userform),
    #path('calculator',views.calculator)
]
