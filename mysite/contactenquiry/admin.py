from django.contrib import admin
from contactenquiry.models import Contactenquiry

class ContactEnquiryAdmin(admin.ModelAdmin):
    list_display=('name','email','created_at')
    search_fields=('name','email')

admin.site.register(Contactenquiry,ContactEnquiryAdmin)

# Register your models here.
