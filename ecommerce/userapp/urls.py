from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns=[
    path('',views.home,name="home"),
    path('userloadlogin',views.userloadlogin,name="userloadlogin"),
    path('userloadregister',views.userloadregister,name="userloadregister"),
    path('myprofile',views.myprofile,name="myprofile"),
    path('register',views.register,name="register"),
    path('login',views.login,name="login"),
    path('logout',views.logout,name="logout"),
    path('contact',views.contact,name="contact"),
    path('cart',views.cart,name="cart"),
    path('cart/<int:pid>',views.cart,name="cart_add"),
    path('clearcart',views.clearCart,name="cart_clear"),
    path('clearcart/<int:id>',views.clearCart,name="cart_remove_item"),
    path('cartstatuschange/<int:cid>', views.change_cart_status, name="change_Cart_status"),
    path('product',views.product,name="product"),
    path('product/specail_offers',views.product,name="specail_offers"),
    path('product/<int:cid>',views.product,name="product_category"),
    path('product/<int:cid>/<int:subcatid>',views.product,name="product_subcategory"),
    path('singlepro/<int:pid>',views.singlepro,name="singlepro"),
    path('wishlist',views.wishlist,name="wishlist"),
    path('wishlist/<str:action>/<int:pid>',views.wishlist, name="wishlist_add"),
    path('wishlist/<str:action>/<int:pid>/<int:wid>',views.wishlist, name="wishlist_remove"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)