from django.db import models
from django.utils import timezone
import uuid

from core.models import User

class Clothes(models.Model):
    MAJOR_TOP = 'top'
    MAJOR_BOTTOMS = 'bottoms'
    MAJOR_SHOES = 'shoes'
    MAJOR_OTHERS = 'others'
    MAJOR_ACCESSROY = 'accessory'
    MAJOR_CATEGORY_CHOICES = (
        (MAJOR_TOP, '상의'),
        (MAJOR_BOTTOMS, '하의'),
        (MAJOR_SHOES, '신발'),
        (MAJOR_ACCESSROY, '액세서리'),
        (MAJOR_OTHERS, '기타'),
    )

    SIZE_CHOICES = (('XS', 'XS'), ('S', 'S'), ('M', 'M'), ('L', 'L'), ('XL', 'XL'))


    clothes_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    major_category = models.CharField(max_length=255, choices=MAJOR_CATEGORY_CHOICES)
    brand = models.CharField(max_length=255, blank=True)
    color = models.CharField(max_length=255, blank=True)
    size = models.CharField(max_length=255, choices=SIZE_CHOICES, blank=True)
    likes = models.IntegerField(default=0)
    price = models.DecimalField(max_digits=10,decimal_places=2, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)