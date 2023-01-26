# Generated by Django 4.1.5 on 2023-01-26 10:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('clothes', '0003_remove_clothes_clothes_id_clothes_id'),
    ]

    operations = [
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
        migrations.AddField(
            model_name='clothes',
            name='minor_category',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='clothes.minorcategory'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='clothes',
            name='major_category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='clothes.majorcategory'),
        ),
    ]