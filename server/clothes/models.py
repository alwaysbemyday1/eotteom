from django.db import models
from django.utils import timezone
import uuid

from core.models import User

class MajorCategory(models.Model):
    id = models.AutoField(primary_key=True)
    name_en = models.CharField(max_length=25)
    name_ko = models.CharField(max_length=25)
    
    def __str__(self):
        return f"{self.name_en} / {self.name_ko}"

class MinorCategory(models.Model):
    id = models.AutoField(primary_key=True)
    major_category = models.ForeignKey(MajorCategory, on_delete=models.CASCADE)
    name_en = models.CharField(max_length=25)
    name_ko = models.CharField(max_length=25)
    
    def __str__(self):
        return f"({self.major_category.name_ko}) {self.name_en} / {self.name_ko}"

class Clothes(models.Model):
    SIZE_CHOICES = (('XS', 'XS'), ('S', 'S'), ('M', 'M'), ('L', 'L'), ('XL', 'XL'))

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    image = models.ImageField(null=True)
    major_category = models.ForeignKey(MajorCategory, on_delete=models.PROTECT)
    minor_category = models.ForeignKey(MinorCategory, on_delete=models.PROTECT)
    brand = models.CharField(max_length=255, blank=True)
    color = models.CharField(max_length=255, blank=True)
    size = models.CharField(max_length=255, choices=SIZE_CHOICES, blank=True)
    likes = models.IntegerField(default=0)
    price = models.DecimalField(max_digits=10,decimal_places=2, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)