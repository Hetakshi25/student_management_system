from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render,redirect
from.forms import usersForm
from service.models import Service
from news.models import News
from django.core.paginator import Paginator
from contactenquiry.models import ContactEnquiry
#from Contactenquiry.models import Contactenquiry

def homepage(request):
    newsdata=News.objects.all()
    servicesdata=Service.objects.all().order_by('-service_title')[:3]
    for a in servicesdata:
        print(a.service_icon)
    print(Service)
    data={
        'servicesdata':servicesdata,
        'newsdata':newsdata


        #'value':2,
        #'f':[10,20,30,40],
        #'s':[10,20,30,40],
       # 'v':'''welcome to mysite'''
    }
    return render(request,"index.html",data)

       # data={
            #'title':'home page',
            #'bdata':'welcome to wscubetech',
            #'clist':['PHP','JAVA','DJango'],
            #'numbers':[10,20,30,40,50],
           # 'student_details':[{'name':'pradeep','phone':9269698122},
              #                  {'name':'testing','phone':9269698122}]
           # }

       # return render(request,"index.html",data)

#def aboutus(request):
    # if request.method=="GET"
    #return render(request,"about.html"{'output':output})

def newsdetails(request,slug):
    newsdetails=News.objects.get(news_slug=slug)
    data={
        'newsdetails':newsdetails
    }
     #terminal output

    return render(request,"newsdetails.html",data)

def submitform(request):
    try:
        if request.method=="POST":
        #n1=int(request.GET['num1'])
        #n2=int(request.GET['num2'])
            n1=int(request.POST.get('num1'))
            n2=int(request.POST.get('num2'))
            finalans=n1+n2
            data={
                'n1':n1,
                'n2':n2,
                'output':finalans
            }
            #url="/about-us/?output={}".format(finalans)
            return HttpResponse(finalans)
    except:
        pass

    #return HttpResponse(request)

def services(request):
    servicedata=Service.objects.all()
    paginator=Paginator(servicedata,2)
    page_number=request.GET.get('page')
    servicedatafinal=paginator.get_page(page_number)
    totalpage=servicedatafinal.paginator.num_pages


    if request.method=="GET":
        st=request.GET.get('servicename')
        if st!=None:
            servicedata=Service.objects.filter(service_title__icontains=st)

    data={
        'servicesdata':servicedatafinal,
        'lastpage':totalpage,
        'totalpagelist':[n+1 for n in range(totalpage)]
    }
    return render(request,"services.html",data)

def aboutus(request):
    if request.method=="GET":
        output=request.GET.get('output')
    return render(request,"about.html",{'output':output})

def contact(request):
    
    return render(request,"contact.html")

def saveEnquiry(request):
     if request.method=="POST":
         name=request.POST.get('name')
         email=request.POST.get('email')
         message=request.POST.get('message')
         en=ContactEnquiry(name=name,email=email,message=message)
         en.save()

         return render(request,"contact.html",{'success':True})
     return render(request,"contact.html")
 #if name and email and message:
               # Contactenquiry.objects.create(
                #name=name,
                #email=email,
               # message=message
           # )
        

       

def marksheet(request):
    total=""
    per=""
    if request.method=="POST":
        s1=int(request.POST.get('subject 1'))
        s2=int(request.POST.get('subject 2'))
        s3=int(request.POST.get('subject 3'))
        s4=int(request.POST.get('subject 4'))
        s5=int(request.POST.get('subject 5'))
        t=s1+s2+s3+s4+s5
        p=t*100/500
        if p>=60:
            d="first div"
        elif p>=48:
            d="second div"
        elif p>=35:
            d="third div"
        else:
            d="fail"
        data={
            'total':t,
            'per':p,
            'div':d
        }
        return render(request,"marksheet.html",data)
    return render(request,"marksheet.html")

def calculator(request):
    c=""
    try:
        if request.method=="POST":
            n1=int(request.POST.get('num1'))
            n2=int(request.POST.get('num2'))
            opr=request.POST.get('opr')
            if opr=="+":
                c=n1+n2
            elif opr=="-":
                c=n1-n2
            elif opr=="*":
                c=n1*n2
            elif opr=="/":
                c=n1/n2
    except:
        c="invalid opr...."
        print(c)
    return render(request,"calculator.html",{'c':c})

def saveevenodd(request):
     c=''
     if request.method=="POST":
        if request.POST.get('num1')=="":
            return render(request,"evenodd.html",{'error':True})
        
        n=eval(request.POST.get('num1'))
        if n%2==0:
             c="Even number"
        else:
             c="Odd number"
     return render(request,"evenodd.html",{'c':c})

def userform(request):
    finalans=0
    fn=usersForm()
    data={'form':fn}

    try:
        if request.method=="POST":
        #n1=int(request.GET['num1'])
        #n2=int(request.GET['num2'])
            n1=int(request.POST.get('num1'))
            n2=int(request.POST.get('num2'))
            finalans=n1+n2
            data={
                'form':fn,
                'output':finalans
            }
            url="/about-us/?output={}".format(finalans)
            return redirect(url)
          
        #print(n1 + n2)
    except:
        pass
    
    return render(request,"userform.html",data)



