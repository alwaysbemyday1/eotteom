from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from .serializers import OutfitSerializer
from .models import Outfit
from clothes.models import Clothes
from clothes.serializers import ClothesRetrieveSerializer

# Create your views here.
class OutfitViewSet(ModelViewSet):
    queryset = Outfit.objects.all()
    serializer_class = OutfitSerializer

    @action(detail=True, methods=['get'], url_path=r'clothes')
    def clothes_outfit(self, request, pk):
        queryset = self.get_queryset().filter(id=pk)
        clothes_queryset = queryset[0].clothes.all()
        count = clothes_queryset.count()

        serializer = ClothesRetrieveSerializer(clothes_queryset, context=self.get_serializer_context(), many=True)
        data = {
            "count" : count,
            "results" : serializer.data
        }
        return Response(data)

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

    @action(detail=True, methods=['get'], url_path=r'likes')
    def outfit_likes(self, request, pk):
        user = request.user
        instance = self.get_object()
        likes = instance.likes
        
        if user in likes.all():
            likes.remove(user)
        else:
            likes.add(user)

        instance.save()
        count = instance.likes.count()
        data = {
            'count': count
        }
        return Response(data)