# Generated by Django 4.1.7 on 2023-09-26 01:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0005_alter_product_product_discription'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_name',
            field=models.CharField(default='', max_length=60),
        ),
    ]