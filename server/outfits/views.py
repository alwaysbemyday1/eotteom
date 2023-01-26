from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from .serializers import OutfitSerializer
from .models import Outfit

# Create your views here.
class OutfitViewSet(ModelViewSet):
    queryset = Outfit.objects.all()
    serializer_class = OutfitSerializer

    @action(detail=False, methods=['get'], url_path=r'list/(?P<user_id>[^/.]+)')
    def user_Outfit(self, request, user_id):
        queryset = self.get_queryset()   
        result_queryset = queryset.filter(user=user_id)

        serializer = OutfitSerializer(result_queryset, context=self.get_serializer_context(), many=True)
        data = {
            "results" : serializer.data
        }
        return Response(data)