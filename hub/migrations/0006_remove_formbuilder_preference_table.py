# -*- coding: utf-8 -*-
# Generated by Django 1.11.25 on 2019-10-17 17:22
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hub', '0005_perusersetting'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='formbuilderpreference',
            name='user',
        ),
        migrations.DeleteModel(
            name='FormBuilderPreference',
        ),
    ]