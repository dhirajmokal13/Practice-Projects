# Generated by Django 4.1.7 on 2023-09-24 07:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0002_whishlist'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=40)),
                ('subject', models.CharField(default=None, max_length=100)),
                ('email', models.EmailField(max_length=20)),
                ('phone', models.ImageField(default=0, max_length=11, upload_to='')),
                ('comment', models.TextField(default=None)),
            ],
        ),
        migrations.AddField(
            model_name='signupuser',
            name='phoneno',
            field=models.IntegerField(default=0),
        ),
    ]
