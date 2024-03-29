# Generated by Django 4.1.5 on 2023-02-26 12:32

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Clothes',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('image', models.ImageField(null=True, upload_to='')),
                ('brand', models.CharField(blank=True, max_length=255)),
                ('color', models.CharField(blank=True, max_length=255)),
                ('fit', models.CharField(blank=True, choices=[('슬림핏', '슬림핏'), ('레귤러핏', '레귤러핏'), ('오버핏', '오버핏')], max_length=255)),
                ('size', models.CharField(blank=True, choices=[('XS', 'XS'), ('S', 'S'), ('M', 'M'), ('L', 'L'), ('XL', 'XL')], max_length=255)),
                ('price', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('is_public', models.BooleanField(default=True)),
                ('is_delete', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='MajorCategory',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name_en', models.CharField(max_length=25)),
                ('name_ko', models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name='MinorCategory',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name_en', models.CharField(max_length=25)),
                ('name_ko', models.CharField(max_length=25)),
                ('major_category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='clothes.majorcategory')),
            ],
        ),
    ]
