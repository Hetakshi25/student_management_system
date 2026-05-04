from django import forms

class usersForm(forms.Form):
    num1=forms.CharField(label="value 1",required=False,widget=forms.TextInput(attrs={'class':"contact-form"}))
    num2=forms.CharField(label="value 2",widget=forms.TextInput(attrs={'class':"contact-form"}))
    num2=forms.CharField(label="value 3",widget=forms.TextInput(attrs={'class':"contact-form"}))
    email=forms.EmailField()

