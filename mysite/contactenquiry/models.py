from django.db import models
class ContactEnquiry(models.Model):
    name=models.CharField( max_length=50)
    email=models.EmailField(max_length=50)
    message=models.TextField()
    created_at=models.DateTimeField(auto_now_add=True)


# Create your models here.
