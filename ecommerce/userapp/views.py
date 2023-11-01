from django.shortcuts import render, redirect
from django.contrib import messages
from adminapp.models import subCategory, Product
from django.contrib.auth.hashers import make_password, check_password
from userapp.models import Contact, Cart, User, Wishlist
from django.http import JsonResponse, HttpResponse
from django.db.models import Q

# Create your views here.
def categoryFetcher():
    """
        This is used for get categories and subcategories and convert this in usable format
    """
    data = subCategory.objects.raw("SELECT *, adminapp_subCategory.id AS subcategory_id FROM adminapp_categoriesuser LEFT JOIN adminapp_subCategory ON adminapp_subcategory.category_id=adminapp_categoriesuser.id")
    grouped_data = {} # declare a blank dictionary
    for item in data:
        category_id = item.id #getting category id
        if category_id not in grouped_data: # check category id present or not for avoid duplications
            grouped_data[category_id] = {
                'id': category_id,
                'category_id': item.category_id,
                'category_name': item.category_name,
                'subcategories': []
            }

        grouped_data[category_id]['subcategories'].append({ # adding subcategory data to array in category
            'subCategory_name': item.subCategory_name,
            'status': item.status,
            'subcategory_id': item.subcategory_id
        })
    return list(grouped_data.values()) # converting to list and return

def home(request):
    top_three_offers = Product.objects.filter(status='AVAILABLE').order_by('-product_discount')[:3]
    daily_staples = Product.objects.raw(
        "SELECT * FROM adminapp_Product JOIN adminapp_CategoriesUser JOIN adminapp_subCategory ON adminapp_Product.category_id=adminapp_CategoriesUser.id AND adminapp_Product.subCategory_id=adminapp_subCategory.id WHERE adminapp_categoriesuser.category_name='HouseHolds' AND adminapp_Product.status='AVAILABLE' LIMIT 4")
    return render(request, 'homepage.html', {'daily_staples': daily_staples, 'cat': categoryFetcher(), 'offers': top_three_offers, 'session': request.session})

def userloadlogin(request):
    if request.session.get('uid'):
        messages.error(request, "You Already Loggedin")
        return redirect('/')
    if request.COOKIES.get('uname') and request.COOKIES.get('pwd'):  # get the cookies
        nm = request.COOKIES.get('uname')
        pwd = request.COOKIES.get('pwd')
        return render(request, 'loginpage.html', {'cname': nm, 'cpwd': pwd,'session': request.session, 'cat': categoryFetcher()})
    else:
        return render(request, 'loginpage.html', {'session': request.session, 'cat': categoryFetcher()})


def userloadregister(request):
    if request.session.get('uid'):
        messages.error(request, "You Already Loggedin")
        return redirect('/')
    return render(request, 'registrationpage.html', {'session': request.session, 'cat': categoryFetcher()})


def myprofile(req):
    if not req.session.get('uid'): #if user Not logged in then redirect to Login page
        messages.error(req, "Login for Access the cart")
        return redirect('/userloadlogin')
    myData = User.objects.filter(id=req.session.get('uid'))
    return render(req, 'myprofile.html', {'session': req.session, 'userData': myData })


def register(req):
    if req.method == 'POST' and req.POST.get('userRegister'):
        exist = User.objects.filter(Q(uname=req.POST.get('uname')) | Q(email=req.POST.get('email'))).exists()
        if exist == False:
            try:
                User(uname=req.POST.get('uname'), password=make_password(req.POST.get(
                    'pwd')), email=req.POST.get('email'), phone=req.POST.get('number')).save()
                messages.success(req, "Account Created Successfully")
                return redirect('/userloadregister')
            except:
                messages.error(req, "Something Went Wrong Account Not Created")
                return redirect('/userloadregister')
        else:
            messages.error(req, "User Already Registered")
            return redirect('/userloadregister')


def login(req):
    if req.method == 'POST' and req.POST.get('lgn'):
        try:
            user = User.objects.get(uname=req.POST.get('Username'))
            if check_password(req.POST.get('password'), user.password):
                req.session['username'] = user.uname
                req.session['uid'] = user.id
                res = redirect('/')
                res.set_cookie('uname', req.POST.get('Username'), max_age=36000) #This cookies will activate for 10hrs
                res.set_cookie('pwd', req.POST.get('password'), max_age=36000) #This cookies will activate for 10hrs
                return res
            else:
                messages.error(req, "Invalid Credentials")
                return redirect('/userloadlogin')
        except:
            messages.error(req, "Invalid Credentials")
            return redirect('/userloadlogin')

def logout(request):
    request.session.flush()  # clear the session
    messages.success(request, "Account Logout Successfully")
    return redirect('/userloadlogin')


def contact(req):
    if req.method == 'POST' and req.POST.get('ctnFrm'):
        Contact(name=req.POST.get('name'), subject=req.POST.get('sub'), email=req.POST.get(
            'email'), phone=req.POST.get('phone'), comment=req.POST.get('comm')).save()
    return render(req, 'contact.html', {'session': req.session, 'cat': categoryFetcher()})


def cart(req, pid=None):
    if not req.session.get('uid'): #if user Not logged in then redirect to Login page
        messages.error(req, "Login for Access the cart")
        return redirect('/userloadlogin')
    uid = req.session.get('uid')  # this should be get from session
    if pid:
        Cart(user_id=uid, pid=pid).save()
        return JsonResponse({'success': True})
    else:
        cart_item = Cart.objects.raw(
            f"SELECT *, adminapp_product.id AS pid, adminapp_product.status AS availiblity FROM userapp_cart JOIN adminapp_product ON userapp_cart.pid=adminapp_Product.id WHERE userapp_cart.user_id={uid}")
        total_cost = 0
        for i in cart_item:
            if i.status == 'cart':
                total_cost = total_cost+float(i.product_discountPrice)
        return render(req, 'cartpage.html', {'cart': cart_item, 'cat': categoryFetcher(), 'cost': round(total_cost, 2), 'session': req.session})

def clearCart(req, id=None):
    if not req.session.get('uid'): #if user Not logged in then redirect to Login page
        messages.error(req, "Login for Access the cart")
        return redirect('/userloadlogin')
    uid = req.session.get('uid')  # this should be get from sessions
    if id:
        Cart.objects.filter(user_id=uid, id=id).delete()
        return redirect('cart')
    else:
        Cart.objects.filter(user_id=uid).delete()
        return redirect('cart')

def change_cart_status(req, cid):
    item = Cart.objects.get(id=cid, user_id=req.session.get('uid'))
    if item.status == 'cart':
        item.status = 'save later'
    else:
        item.status = 'cart'
    item.save()
    messages.success(req, "Cart Updated Successfully")
    return redirect('cart')

def product(req, cid=None, subcatid=None):
    if cid and subcatid:
        all_products = Product.objects.raw(
            f"SELECT * FROM adminapp_Product JOIN adminapp_CategoriesUser JOIN adminapp_subCategory ON adminapp_Product.category_id=adminapp_CategoriesUser.id AND adminapp_Product.subCategory_id=adminapp_subCategory.id WHERE adminapp_CategoriesUser.id='{cid}' AND adminapp_subCategory.id='{subcatid}'")
        try:
            products_card_title = f"{all_products[0].category_name} ({len(all_products)})"
        except:
            products_card_title = "No Data Found (0)"
    elif cid:
        all_products = Product.objects.raw(
            f"SELECT * FROM adminapp_Product JOIN adminapp_CategoriesUser JOIN adminapp_subCategory ON adminapp_Product.category_id=adminapp_CategoriesUser.id AND adminapp_Product.subCategory_id=adminapp_subCategory.id WHERE adminapp_CategoriesUser.id='{cid}'")
        try:
            products_card_title = f"{all_products[0].category_name} ({len(all_products)})"
        except:
            products_card_title = "No Data Found (0)"
    else:
        if req.path=="/product/specail_offers":
            min_discount = 10 #add min descount here
            all_products = Product.objects.raw(
            f"SELECT * FROM adminapp_Product JOIN adminapp_CategoriesUser JOIN adminapp_subCategory ON adminapp_Product.category_id=adminapp_CategoriesUser.id AND adminapp_Product.subCategory_id=adminapp_subCategory.id WHERE adminapp_Product.product_discount>={min_discount} ORDER BY adminapp_Product.product_discount DESC")
            products_card_title = f"Special Offers - More than {min_discount}% OFF"
        else:
            all_products = Product.objects.raw(
            "SELECT * FROM adminapp_Product JOIN adminapp_CategoriesUser JOIN adminapp_subCategory ON adminapp_Product.category_id=adminapp_CategoriesUser.id AND adminapp_Product.subCategory_id=adminapp_subCategory.id")
            products_card_title = "All Products"
    return render(req, 'products.html', {'prod': all_products, 'cat': categoryFetcher(), 'card_title': products_card_title, 'session': req.session})


def singlepro(req, pid):
    prod = Product.objects.get(id=pid)
    return render(req, 'singlepropage.html', {'product': prod, 'session': req.session, 'cat': categoryFetcher()})

def wishlist(req, pid=None, wid=None, action=None):
    if not req.session.get('uid'): #if user Not logged in then redirect to Login page
        messages.error(req, "Login for Access the wishlist")
        return redirect('/userloadlogin')  
    user_id = req.session.get('uid')  # this should be get from session
    if action=="add" or action=="remove":
        user_instance = User.objects.get(id=user_id) # user table instance
        product_instance = Product.objects.get(id=pid) # product table instance
        match action: # Match case is not be support below of python 3.10 versions otherwise use if else
            case "add":
                try:
                    Wishlist(user_id=user_instance, product_id=product_instance).save()
                    messages.success(req, f"{ product_instance.product_name } - is successfully Added to wishlist")
                    return redirect(req.META.get('HTTP_REFERER', None))
                except Exception as e:
                    messages.error(req, "(500) Error Can't Added to wishlist")
                    return redirect(req.META.get('HTTP_REFERER', None))
            case "remove":
                Wishlist.objects.filter(id=wid, user_id=user_instance).delete()
                messages.success(req, f"{ product_instance.product_name } - is successfully Removed from wishlist")
                return redirect(req.META.get('HTTP_REFERER', None))
            case _:
                return HttpResponse("Invalid action")
    else:
        prod = Product.objects.raw(f"SELECT userapp_wishlist.*, adminapp_product.* FROM userapp_wishlist JOIN adminapp_product JOIN userapp_user ON userapp_wishlist.product_id_id=adminapp_product.id AND userapp_wishlist.user_id_id=userapp_user.id WHERE userapp_wishlist.user_id_id='{user_id}'")
        return render(req, 'wishlist.html', { 'wishlist': prod, 'session': req.session, 'cat': categoryFetcher() })
