from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from django.db.models import Q

class MultiAuthBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        UserModel = get_user_model()
        if username is None:
            username = kwargs.get(UserModel.USERNAME_FIELD)
        
        try:
            # Check by username, email, phone, first_name, or last_name
            user = UserModel.objects.filter(
                Q(username__iexact=username) | 
                Q(email__iexact=username) | 
                Q(phone__iexact=username) |
                Q(first_name__iexact=username) |
                Q(last_name__iexact=username)
            ).first()
            
            if not user:
                # Try matching "First Last" combined
                from django.db.models.functions import Concat
                from django.db.models import Value
                user = UserModel.objects.annotate(
                    full_name=Concat('first_name', Value(' '), 'last_name')
                ).filter(full_name__iexact=username).first()
                
        except Exception:
            return None

        if user and user.check_password(password) and self.user_can_authenticate(user):
            return user
        return None

