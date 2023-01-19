from django.db import models
from django.utils import timezone
import uuid

from core.models import User

class Clothes(models.Model):
    clothes_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    major_category = models.CharField(max_length=255)
    brand = models.CharField(max_length=255, blank=True)
    color = models.CharField(max_length=255, blank=True)
    size = models.CharField(max_length=255, blank=True)
    likes = models.IntegerField(default=0)
    price = models.DecimalField(max_digits=10,decimal_places=2, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)