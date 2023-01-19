from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register('clothes', views.ClothesViewSet)

urlpatterns = [
    path('', include(router.urls)),
]