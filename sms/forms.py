from django import forms
from .models import Course, CustomUser, Student, Teacher, StudentFee, TeacherSalary, Department

class StudentFeeForm(forms.ModelForm):
    class Meta:
        model = StudentFee
        fields = '__all__'
        exclude = ['payment_date', 'created_at', 'updated_at']
        widgets = {
            'student': forms.Select(attrs={'class': 'form-control'}),
            'fee_amount': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Fee Amount'}),
            'description': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Optional Description'}),
            'status': forms.Select(attrs={'class': 'form-control'}),
        }

class TeacherSalaryForm(forms.ModelForm):
    class Meta:
        model = TeacherSalary
        fields = '__all__'
        exclude = ['payment_date', 'created_at', 'updated_at']
        widgets = {
            'teacher': forms.Select(attrs={'class': 'form-control'}),
            'salary_amount': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Salary Amount'}),
            'description': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Optional Description'}),
            'status': forms.Select(attrs={'class': 'form-control'}),
        }

class AddStudentForm(forms.Form):
    email = forms.EmailField(label="Email", max_length=50, widget=forms.EmailInput(attrs={"class":"form-control"}))
    password = forms.CharField(label="Password", max_length=50, widget=forms.PasswordInput(attrs={"class":"form-control"}))
    first_name = forms.CharField(label="First Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    last_name = forms.CharField(label="Last Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    username = forms.CharField(label="Username", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    phone = forms.CharField(label="Phone Number", max_length=15, widget=forms.TextInput(attrs={"class":"form-control"}), required=False)
    address = forms.CharField(label="Address", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))

    
    gender_list = (
        ('Male', 'Male'),
        ('Female', 'Female')
    )
    gender = forms.ChoiceField(label="Gender", choices=gender_list, widget=forms.Select(attrs={"class":"form-control"}))
    course_id = forms.ChoiceField(label="Course", widget=forms.Select(attrs={"class":"form-control"}))
    profile_pic = forms.FileField(label="Profile Pic", widget=forms.FileInput(attrs={"class":"form-control"}), required=False)

    def __init__(self, *args, **kwargs):
        super(AddStudentForm, self).__init__(*args, **kwargs)
        course_list = []
        try:
            courses = Course.objects.all()
            for course in courses:
                course_list.append((course.id, course.name))
        except:
            course_list = []
        self.fields['course_id'].choices = course_list

    def clean_username(self):
        username = self.cleaned_data['username']
        if CustomUser.objects.filter(username=username).exists():
            raise forms.ValidationError("Username already exists")
        return username

    def clean_email(self):
        email = self.cleaned_data['email']
        if CustomUser.objects.filter(email=email).exists():
            raise forms.ValidationError("Email already exists")
        return email

    def clean_first_name(self):
        first_name = self.cleaned_data['first_name']
        if not first_name.isalpha():
            raise forms.ValidationError("First name must only contain alphabets")
        return first_name

    def clean_last_name(self):
        last_name = self.cleaned_data['last_name']
        if not last_name.isalpha():
            raise forms.ValidationError("Last name must only contain alphabets")
        return last_name

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if phone and (not phone.isdigit() or len(phone) != 10):
            raise forms.ValidationError("Phone number must be exactly 10 digits")
        return phone


class EditStudentForm(forms.Form):
    email = forms.EmailField(label="Email", max_length=50, widget=forms.EmailInput(attrs={"class":"form-control"}))
    first_name = forms.CharField(label="First Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    last_name = forms.CharField(label="Last Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    username = forms.CharField(label="Username", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    phone = forms.CharField(label="Phone Number", max_length=15, widget=forms.TextInput(attrs={"class":"form-control"}), required=False)
    address = forms.CharField(label="Address", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))

    
    gender_list = (
        ('Male', 'Male'),
        ('Female', 'Female')
    )
    gender = forms.ChoiceField(label="Gender", choices=gender_list, widget=forms.Select(attrs={"class":"form-control"}))
    course_id = forms.ChoiceField(label="Course", widget=forms.Select(attrs={"class":"form-control"}))
    password = forms.CharField(label="Change Password (leave blank to keep current)", max_length=50, widget=forms.PasswordInput(attrs={"class":"form-control"}), required=False)
    profile_pic = forms.FileField(label="Profile Pic", widget=forms.FileInput(attrs={"class":"form-control"}), required=False)

    def __init__(self, *args, **kwargs):
        super(EditStudentForm, self).__init__(*args, **kwargs)
        course_list = []
        try:
            courses = Course.objects.all()
            for course in courses:
                course_list.append((course.id, course.name))
        except:
            course_list = []
        self.fields['course_id'].choices = course_list

    def clean_first_name(self):
        first_name = self.cleaned_data['first_name']
        if not first_name.isalpha():
            raise forms.ValidationError("First name must only contain alphabets")
        return first_name

    def clean_last_name(self):
        last_name = self.cleaned_data['last_name']
        if not last_name.isalpha():
            raise forms.ValidationError("Last name must only contain alphabets")
        return last_name

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if phone and (not phone.isdigit() or len(phone) != 10):
            raise forms.ValidationError("Phone number must be exactly 10 digits")
        return phone


class AddTeacherForm(forms.Form):
    email = forms.EmailField(label="Email", max_length=50, widget=forms.EmailInput(attrs={"class":"form-control"}))
    password = forms.CharField(label="Password", max_length=50, widget=forms.PasswordInput(attrs={"class":"form-control"}))
    first_name = forms.CharField(label="First Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    last_name = forms.CharField(label="Last Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    username = forms.CharField(label="Username", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    address = forms.CharField(label="Address", max_length=255, widget=forms.TextInput(attrs={"class":"form-control"}))
    phone = forms.CharField(label="Phone Number", max_length=15, widget=forms.TextInput(attrs={"class":"form-control"}), required=False)
    department_id = forms.ChoiceField(label="Department", widget=forms.Select(attrs={"class":"form-control"}))

    def __init__(self, *args, **kwargs):
        super(AddTeacherForm, self).__init__(*args, **kwargs)
        dept_list = []
        try:
            depts = Department.objects.all()
            for dept in depts:
                dept_list.append((dept.id, dept.name))
        except:
            dept_list = []
        self.fields['department_id'].choices = dept_list

    def clean_username(self):
        username = self.cleaned_data['username']
        if CustomUser.objects.filter(username=username).exists():
            raise forms.ValidationError("Username already exists")
        return username

    def clean_email(self):
        email = self.cleaned_data['email']
        if CustomUser.objects.filter(email=email).exists():
            raise forms.ValidationError("Email already exists")
        return email

    def clean_first_name(self):
        first_name = self.cleaned_data['first_name']
        if not first_name.isalpha():
            raise forms.ValidationError("First name must only contain alphabets")
        return first_name

    def clean_last_name(self):
        last_name = self.cleaned_data['last_name']
        if not last_name.isalpha():
            raise forms.ValidationError("Last name must only contain alphabets")
        return last_name

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if phone and (not phone.isdigit() or len(phone) != 10):
            raise forms.ValidationError("Phone number must be exactly 10 digits")
        return phone


class EditTeacherForm(forms.Form):
    email = forms.EmailField(label="Email", max_length=50, widget=forms.EmailInput(attrs={"class":"form-control"}))
    first_name = forms.CharField(label="First Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    last_name = forms.CharField(label="Last Name", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    username = forms.CharField(label="Username", max_length=50, widget=forms.TextInput(attrs={"class":"form-control"}))
    address = forms.CharField(label="Address", max_length=255, widget=forms.TextInput(attrs={"class":"form-control"}))
    phone = forms.CharField(label="Phone Number", max_length=15, widget=forms.TextInput(attrs={"class":"form-control"}), required=False)
    department_id = forms.ChoiceField(label="Department", widget=forms.Select(attrs={"class":"form-control"}))
    password = forms.CharField(label="Change Password (leave blank to keep current)", max_length=50, widget=forms.PasswordInput(attrs={"class":"form-control"}), required=False)

    def __init__(self, *args, **kwargs):
        super(EditTeacherForm, self).__init__(*args, **kwargs)
        dept_list = []
        try:
            depts = Department.objects.all()
            for dept in depts:
                dept_list.append((dept.id, dept.name))
        except:
            dept_list = []
        self.fields['department_id'].choices = dept_list

    def clean_first_name(self):
        first_name = self.cleaned_data['first_name']
        if not first_name.isalpha():
            raise forms.ValidationError("First name must only contain alphabets")
        return first_name

    def clean_last_name(self):
        last_name = self.cleaned_data['last_name']
        if not last_name.isalpha():
            raise forms.ValidationError("Last name must only contain alphabets")
        return last_name

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if phone and (not phone.isdigit() or len(phone) != 10):
            raise forms.ValidationError("Phone number must be exactly 10 digits")
        return phone



