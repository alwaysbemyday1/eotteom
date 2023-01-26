from django.contrib import admin

from .models import Clothes, MajorCategory, MinorCategory

# Register your models here.
admin.site.register(Clothes)
admin.site.register(MajorCategory)
admin.site.register(MinorCategory)