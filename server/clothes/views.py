from rest_framework.decorators import action
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from core.models import User
from .models import Clothes
from .serializers import ClothesSerializer

# Create your views here.
class ClothesViewSet(ModelViewSet):
    queryset = Clothes.objects.all()
    serializer_class = ClothesSerializer

    @action(detail=False, methods=['get'], url_path=r'(?P<user_id>[^/.]+)')
    def user_clothes(self, request, user_id):
        queryset = self.get_queryset()   
        result_queryset = queryset.filter(user=user_id)

        serializer = ClothesSerializer(result_queryset, context=self.get_serializer_context(), many=True)
        data = {
            "results" : serializer.data
        }
        return Response(data)