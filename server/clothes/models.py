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
    FIT_CHOICES = (('슬림핏', '슬림핏'), ('레귤러핏', '레귤러핏'), ('오버핏', '오버핏'))

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE, related_name='clothes')
    name = models.CharField(max_length=255)
    image = models.ImageField(null=True)
    major_category = models.ForeignKey(MajorCategory, on_delete=models.PROTECT, related_name='clothes')
    minor_category = models.ForeignKey(MinorCategory, on_delete=models.PROTECT, related_name='clothes')
    brand = models.CharField(max_length=255, blank=True)
    color = models.CharField(max_length=255, blank=True)
    fit = models.CharField(max_length=255, choices=FIT_CHOICES, blank=True)
    size = models.CharField(max_length=255, choices=SIZE_CHOICES, blank=True)
    likes = models.ManyToManyField(User, blank=True, related_name='liked_clothes')
    price = models.DecimalField(max_digits=10,decimal_places=2, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)