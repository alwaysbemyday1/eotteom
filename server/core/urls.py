from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register('api/users', views.UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api/', views.HomeView),
]