from django.db import models
from django.utils import timezone
import uuid

from core.models import User
from clothes.models import Clothes

class Outfit(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE)
    clothes = models.ManyToManyField(Clothes, blank=True)
    name = models.CharField(max_length=255)
    style = models.CharField(max_length=255, blank=True)
    date = models.DateTimeField(default=timezone.now)
    temperature = models.IntegerField(blank=True, null=True)
    likes = models.IntegerField(default=0)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)