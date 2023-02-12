from django.db import models
from django.utils import timezone
import uuid

from core.models import User
from clothes.models import Clothes

class Outfit(models.Model):
    SEASON_CHOICES = (('봄', '봄'), ('여름', '여름'), ('가을', '가을'), ('겨울', '겨울'))
    STYLE_CHOICES = (('캐주얼', '캐주얼'),('클래식', '클래식'),('빈티지', '빈티지'),('스트릿', '스트릿'),('스포티', '스포티'),('모던', '모던'),('댄디', '댄디'),('미니멀', '미니멀'),('레이어드', '레이어드'),('논코어', '논코어'),('페미닌', '페미닌'),('맥시멀', '맥시멀'),('아메리칸 캐주얼', '아메리칸 캐주얼'),('에스닉', '에스닉'),('아방가르드', '아방가르드'))
    
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, db_column="user_id", on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    image = models.ImageField()
    clothes = models.ManyToManyField(Clothes, blank=True)
    style = models.CharField(max_length=255, choices=STYLE_CHOICES)
    date = models.DateTimeField(default=timezone.now)
    season = models.CharField(max_length=25, choices=SEASON_CHOICES)
    likes = models.IntegerField(default=0)
    created_at = models.DateTimeField(default=timezone.now)
    is_public = models.BooleanField(default=True)
    is_delete = models.BooleanField(default=False)