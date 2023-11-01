from django.db import models

# Create your models here.
class  CategoriesUser(models.Model):
    category_name=models.CharField(max_length=30,default='')
    stdStatus=models.TextChoices('stdStatus','AVAILABLE UNAVAILABLE')
    status=models.CharField(default='AVAILABLE',choices=stdStatus.choices,max_length=30)

class subCategory(models.Model):
    category_id=models.IntegerField(default=0)
    subCategory_name=models.CharField(max_length=30,default='')
    stdStatus=models.TextChoices('stdStatus','AVAILABLE UNAVAILABLE')
    status=models.CharField(default='AVAILABLE',choices=stdStatus.choices,max_length=30)

class Product(models.Model):
    category_id=models.IntegerField(default=0)
    subCategory_id=models.IntegerField(default=0)
    product_name=models.CharField(max_length=60,default='')
    product_price=models.CharField(max_length=30, default='')
    product_discount=models.CharField(max_length=30,default='')
    product_discountPrice=models.CharField(max_length=30,default='')
    product_image=models.ImageField(max_length=255,default='',upload_to='product/product_image')
    product_discription=models.TextField(default="")
    stdstatus=models.TextChoices('stdStatus','AVAILABLE UNAVAILABLE')
    status=models.CharField(default='AVAILABLE',choices=stdstatus.choices,max_length=30)