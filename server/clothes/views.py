from rest_framework import viewsets
from rest_framework.response import Response

from .models import Clothes
from .serializers import ClothesSerializer

# Create your views here.
class ClothesViewSet(viewsets.ModelViewSet):
    queryset = Clothes.objects.all()
    serializer_class = ClothesSerializer