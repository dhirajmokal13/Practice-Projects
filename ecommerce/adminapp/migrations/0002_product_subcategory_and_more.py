# Generated by Django 4.1.7 on 2023-05-16 11:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_id', models.IntegerField(default=0)),
                ('subCategory_id', models.IntegerField(default=0)),
                ('product_name', models.CharField(default='', max_length=30)),
                ('product_price', models.CharField(default='', max_length=30)),
                ('product_discount', models.CharField(default='', max_length=30)),
                ('product_discountPrice', models.CharField(default='', max_length=30)),
                ('product_image', models.ImageField(default='', max_length=30, upload_to='product/image')),
                ('product_discription', models.CharField(default='', max_length=30)),
                ('status', models.CharField(choices=[('BLOCK', 'Block'), ('UNBLOCK', 'Unblock')], default='AVAILABLE', max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='subCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_id', models.IntegerField(default=0)),
                ('subCategory_name', models.CharField(default='', max_length=30)),
                ('status', models.CharField(choices=[('AVAILABLE', 'Available'), ('UNAVAILABLE', 'Unavailable')], default='AVAILABLE', max_length=30)),
            ],
        ),
        migrations.RemoveField(
            model_name='categoriesuser',
            name='categoryname',
        ),
        migrations.AddField(
            model_name='categoriesuser',
            name='category_name',
            field=models.CharField(default='', max_length=30),
        ),
        migrations.AddField(
            model_name='categoriesuser',
            name='status',
            field=models.CharField(choices=[('AVAILABLE', 'Available'), ('UNAVAILABLE', 'Unavailable')], default='AVAILABLE', max_length=30),
        ),
    ]