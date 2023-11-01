from django.urls import path
from .import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns=[

    path('',views.loadAdminLogin),
    path('dashboard',views.dashboard,name='dashboard'),
    path('loginuser',views.loginUser),
    path('logout',views.userlogout,name='logout'),
    path('categories',views.showcategories,name='categories'),
    path('loadcategoryform',views.loadCategoryForm,name='loadcategoryform'),
    path('insertCategory',views.insertCategory),
    path('status/<int:sid>/<str:vstatus>',views.statusFunctionality,name='status'),

    path('deleteCategory/<int:sid>',views.deleteCategory,name='delete'),
    path('edit/<int:sid>',views.editCategory,name='edit'),
    path('update/<int:sid>',views.updateCategory),

    path('subCategories',views.subCategories,name='subCategory'),
    path('addsubCategory',views.addsubCategory,name='addsubCategory'),
    path('insertsubCategory',views.insertsubCategory),
    path('deletesubCategory/<int:sbid>',views.deletesubCategory,name='deletesub'),
    path('editsubCategory/<int:sbid>',views.editsubCategory,name='editsub'),
    path('updatesubCategory/<int:sbid>',views.updatesubCategory),
    path('statusFunctionalitysub/<int:sbid>/<str:sstatus>',views.statusFunctionalitysub,name='statussub'),
    path('getSubcat',views.getSubcat),

    path('showProduct',views.showProduct,name='showProduct'),
    path('addProduct',views.addProduct,name='addProduct'),
    path('insertproduct',views.insertproduct),
    path('deleteproduct/<int:pid>',views.deleteproduct,name='deleteproduct'),
    path('editproduct/<int:pid>', views.editproduct, name='editproduct'),
    path('updateproduct/<int:pid>',views.updateproduct),
    path('statusFunctionalitypro/<int:pid>/<str:pstatus>',views.statusFunctionalitypro,name='statusFunctionalitypro')

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)