# Generated by Django 4.1.7 on 2023-09-25 02:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0007_user_delete_signupuser'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='status',
            field=models.CharField(choices=[('save', 'Save'), ('later', 'Later')], default='cart', max_length=10),
        ),
    ]
