from django.urls import path, include
from rest_framework import routers
from .views import ClothesViewSet

router = routers.DefaultRouter()
router.register('<int:id>', ClothesViewSet, basename="Clothes")

urlpatterns = [
    path('/', include(router.urls)),
]
