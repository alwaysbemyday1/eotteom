from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import AllowAny


from .serializers import OutfitSerializer
from .models import Outfit

# Create your views here.
class OutfitViewSet(ModelViewSet):
    queryset = Outfit.objects.all()
    serializer_class = OutfitSerializer

    @action(detail=False, methods=['get'], url_path=r'list/others')
    def others_outfit(self, request):
        queryset = self.get_queryset()
        user = request.user
        result_queryset = queryset.exclude(user=user)
        count = result_queryset.count()
            
        serializer = OutfitSerializer(result_queryset, context=self.get_serializer_context(), many=True)
        data = {
            "count" : count,
            "results" : serializer.data
        }
        return Response(data)

    @action(detail=False, methods=['get'], url_path=r'list/(?P<user_id>[^/.]+)')
    def user_outfit(self, request, user_id):
        queryset = self.get_queryset()   
        result_queryset = queryset.filter(user=user_id)

        count = result_queryset.count()
        serializer = OutfitSerializer(result_queryset, context=self.get_serializer_context(), many=True)
        data = {
            "count" : count,
            "results" : serializer.data
        }
        return Response(data)