from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register('api/clothes', views.ClothesViewSet)
# router.register('api/clothes/bulk/', views.ClothesBulkView.as_view(), basename='bulk_read_delete')

urlpatterns = [
    path('', include(router.urls)),
]