from django.db import models
from django.utils import timezone
import uuid

from core.models import User
from clothes.models import Clothes

class Outfit(models.Model):
    SEASON_CHOICES = (('봄', '봄'), ('여름', '여름'), ('가을', '가을'), ('겨울', '겨울'))

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    image = models.ImageField(null=True)
    clothes = models.ManyToManyField(Clothes, blank=True)
    style = models.CharField(max_length=255, blank=True)
    date = models.DateTimeField(default=timezone.now)
    season = models.CharField(max_length=25, choices=SEASON_CHOICES, blank=True)
    likes = models.IntegerField(default=0)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)