# Generated by Django 4.1.7 on 2023-09-25 07:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0004_alter_product_product_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_discription',
            field=models.TextField(default=''),
        ),
    ]
