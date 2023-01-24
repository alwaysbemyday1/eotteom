from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from .serializers import OutfitsSerializer
from .models import Outfits

# Create your views here.
class OutfitsViewSet(ModelViewSet):
    queryset = Outfits.objects.all()
    serializer_class = OutfitsSerializer

    @action(detail=False, methods=['get'], url_path=r'(?P<user_id>[^/.]+)')
    def user_Outfits(self, request, user_id):
        queryset = self.get_queryset()   
        result_queryset = queryset.filter(user=user_id)

        serializer = OutfitsSerializer(result_queryset, context=self.get_serializer_context(), many=True)
        data = {
            "results" : serializer.data
        }
        return Response(data)