from django.db import models
from adminapp.models import Product

# Create your models here.
class Contact(models.Model):
    name = models.CharField(max_length=40, default='')
    subject = models.CharField(max_length=100, default=None)
    email = models.EmailField(max_length=40)
    phone = models.ImageField(max_length=11, default=0)
    comment = models.TextField(default=None)


class Cart(models.Model):
    user_id = models.IntegerField(default=0)
    pid = models.IntegerField(default=0)
    stdstatus=models.TextChoices('cart','save later')
    status=models.CharField(default='cart',choices=stdstatus.choices,max_length=10)

class User(models.Model):
    uname = models.CharField(max_length=40, default=None)
    password = models.CharField(max_length=300, default=None)
    email = models.EmailField(max_length=40)
    phone = models.ImageField(max_length=11, default=0)
    
class Wishlist(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)