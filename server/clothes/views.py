from django.db.models import Count

from rest_framework.decorators import action
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from .models import Clothes, MajorCategory
from .serializers import ClothesSerializer, ClothesRetrieveSerializer

# Create your views here.
class ClothesViewSet(ModelViewSet):
    queryset = Clothes.objects.all()
    category_queryset = MajorCategory.objects.all()
    serializer_class = ClothesSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = ClothesRetrieveSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = ClothesRetrieveSerializer(instance, context=self.get_serializer_context())
        return Response(serializer.data)

    @action(detail=False, methods=['get'], url_path=r'list/(?P<user_id>[^/.]+)')
    def user_clothes(self, request, user_id):
        params = request.query_params
        queryset = self.get_queryset().filter(user=user_id).order_by('-created_at')

        if 'major' in params:
            queryset = queryset.filter(major_category=params['major']).order_by('-created_at')
        
        serializer = ClothesSerializer(queryset, context=self.get_serializer_context(), many=True)
        data = {
            "results" : serializer.data
        }
        return Response(data)

    @action(detail=False, methods=['get'], url_path=r'stats/(?P<user_id>[^/.]+)')
    def user_clothes_stats(self, request, user_id):
        queryset = self.get_queryset().filter(user=user_id)
        
        total_count = queryset.count()
        category_count = [] 
        category_value = queryset.values('major_category').annotate(count=Count('major_category'))
        for i in category_value:
            new_category_value = {'major_category': self.category_queryset.filter(id=1).values('name_en').get()['name_en'], 'count':i['count']}
            category_count.append(new_category_value)
        color_count = queryset.values('color').annotate(count=Count('color'))
        brand_count = queryset.values('brand').annotate(count=Count('brand'))

        data = {
            "total_count" : total_count,
            "category_count" : category_count,
            "color_count" : color_count,
            "brand_count" : brand_count,
        }
        return Response(data)

