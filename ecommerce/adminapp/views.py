from django.shortcuts import render,redirect
from django.contrib.auth.models import auth
from django.contrib import messages
from .models import CategoriesUser,subCategory,Product

# Create your views here.
def loadAdminLogin(request):
    return render(request,'page-login.html')

def dashboard(request):
    return render(request,'index.html')

def loginUser(request):
    if request.method=='POST':
        vuname=request.POST.get('uname')
        vpwd=request.POST.get('pwd')
        #check the username and password exists
        myuser=auth.authenticate(username=vuname,password=vpwd)

        if myuser is not None:
            auth.login(request,myuser)
            return redirect('dashboard')
        else:
            messages.success(request,'Invalid username and password')
            return redirect('/')
    else:
        return render(request,'page-login.html')

def userlogout(request):
    auth.logout(request)
    return redirect('/')

def loadCategoryForm(request):
    return render(request,'add_category.html')

def showcategories(request):
    obj=CategoriesUser.objects.all()
    return render(request,'category.html',{'data':obj})

def insertCategory(request):
    if request.method=='POST':
        cname=request.POST.get('category') #get the value from textbox
        obj=CategoriesUser()
        obj.category_name=cname

        obj.save() #insert record permanently
        return redirect('categories')
    else:
        return render(request,'loadcategoryform')

def statusFunctionality(request,sid,vstatus):
    if(vstatus=='AVAILABLE'):
        obj=CategoriesUser.objects.get(id=sid)
        obj.status='UNAVAILABLE'
        obj.save()
        return redirect('/categories')
    else:
        obj=CategoriesUser.objects.get(id=sid)
        obj.status='AVAILABLE'
        obj.save()
        return redirect('/categories')

def deleteCategory(request,sid):
    obj=CategoriesUser.objects.get(id=sid)
    obj.delete()
    return redirect('/categories')

def editCategory(request,sid):
    obj=CategoriesUser.objects.get(id=sid)
    return render(request,'edit_category.html',{'datae':obj})

def updateCategory(request,sid):
    cname=request.POST.get('category')
    obj=CategoriesUser.objects.get(id=sid)
    obj.category_name=cname
    obj.save()
    return redirect('categories')

def subCategories(request):
    obj=subCategory.objects.raw("SELECT * FROM adminapp_CategoriesUser LEFT JOIN adminapp_subCategory ON adminapp_subCategory.category_id=adminapp_CategoriesUser.id")
    return render(request,'subcategory.html',{'subcat':obj})

def addsubCategory(request):
    obj_cat=CategoriesUser.objects.all()
    return render(request,'add-subcategory.html',{'cat':obj_cat})

def insertsubCategory(request):
    if request.method=='POST':
        try:
            cat=request.POST.get('category')
            subname=request.POST.get('subcategory') #get value from textbox
            obj=subCategory()
            obj.subCategory_name=subname
            obj.category_id=cat
            obj.save() #insert record permanently
            return redirect('/adminapp/subCategories')
        except Exception as e:
            print(e)
    else:
        return render(request,'add-subcategory.html')

def deletesubCategory(request,sbid):
    obj = subCategory.objects.get(id=sbid)
    obj.delete()
    return redirect('subCategories')


def editsubCategory(request,sbid):
    obj=subCategory.objects.get(id=sbid)
    sobj=CategoriesUser.objects.all()
    return render(request,'edit_subcategory.html',{'std':obj,'cat':sobj})


def updatesubCategory(request,sbid):
    cname=request.POST.get('category')
    sname=request.POST.get('subcategory')

    obj=subCategory.objects.get(id=sbid)
    obj.category_id = cname
    obj.subCategory_name=sname

    obj.save()
    return redirect('subCategories')

def statusFunctionalitysub(request,sbid,sstatus):
    if(sstatus=='AVAILABLE'):
        obj=subCategory.objects.get(id=sbid)
        obj.status='UNAVAILABLE'
        obj.save()
        return redirect('/subCategories')
    else:
        obj=subCategory.objects.get(id=sbid)
        obj.status='AVAILABLE'
        obj.save()
        return redirect('/subCategories')

def getSubcat(request):
    vcategory=request.GET.get('category')
    vsubcategory=subCategory.objects.filter(category_id=vcategory) #it will display state based on category
    return render(request,'get_subcategory.html',{'subcategory':vsubcategory})

def showProduct(request):
    obj_pro=Product.objects.raw("SELECT * FROM adminapp_Product JOIN adminapp_CategoriesUser JOIN adminapp_subCategory ON adminapp_Product.category_id=adminapp_CategoriesUser.id AND adminapp_Product.subCategory_id=adminapp_subCategory.id")
    return render(request,'product.html',{'pro':obj_pro})

def addProduct(request):
    obj_cat=CategoriesUser.objects.all()
    obj_subcat=subCategory.objects.all()
    return render(request,'add_product.html',{'cat':obj_cat,'subcat':obj_subcat})

def insertproduct(request):
    if request.method=='POST':
        print(request.POST)
        pcat=request.POST.get('category')
        psubcat=request.POST.get('subcategory')
        vname=request.POST.get('pname')
        vprice=request.POST.get('pprice')
        vdiscount=request.POST.get('pdiscount')
        vdiscount_price=request.POST.get('pdprice')
        vimage=request.FILES['pimage']
        vdescription=request.POST.get('pdescription')

        obj=Product()
        obj.category_id=pcat
        obj.subCategory_id=psubcat
        obj.product_name=vname
        obj.product_price=vprice
        obj.product_discount=vdiscount
        obj.product_discountPrice=vdiscount_price
        obj.product_image=vimage
        obj.product_discription=vdescription
        obj.save()
        return redirect('showProduct')
    else:
        return render(request,'add_product.html')

def deleteproduct(request,pid):

    obj = Product.objects.get(id=pid)
    obj.delete()
    return redirect('/showProduct')

def editproduct(request,pid):
    obj=Product.objects.get(id=pid)
    sobj=CategoriesUser.objects.all()   #object of category class for getting dropdownlist
    obj_subcat=subCategory.objects.all()
    return render(request,'edit_product.html',{'std':obj,'cat':sobj,'subcat':obj_subcat})

def updateproduct(request,pid):
    if request.method=='POST':

        # pcat=request.POST.get('category')

        psubcat=request.POST.get('subcategory')
        vname=request.POST.get('pname')
        vprice=request.POST.get('pprice')
        vdiscount=request.POST.get('pdiscount')
        vdiscount_price=request.POST.get('pdprice')

        vimage=request.FILES['pimage']
        vdescription=request.POST.get('pdescription')
        obj=Product.objects.get(id=pid)
        # obj.category_id=pcat
        obj.subCategory_id=psubcat
        obj.product_name=vname
        obj.product_price=vprice
        obj.product_discount=vdiscount
        obj.product_discountPrice=vdiscount_price
        obj.product_image=vimage
        obj.product_discription=vdescription

        obj.save()
        return redirect('showProduct')
    else:
        return render(request, 'edit_product.html')

def statusFunctionalitypro(request,pid,pstatus):
    if(pstatus=='AVAILABLE'):
        obj=Product.objects.get(id=pid)
        obj.status='UNAVAILABLE'
        obj.save()
        return redirect('/adminapp/showProduct')
    else:
        obj=Product.objects.get(id=pid)
        obj.status='AVAILABLE'
        obj.save()
        return redirect('/adminapp/showProduct')

