from django.db.models import Count
from django.shortcuts import get_object_or_404

from rest_framework import status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet

from .models import Clothes, MajorCategory, MinorCategory
from .serializers import ClothesSerializer, ClothesRetrieveSerializer, MajorCategorySerializer, MinorCategorySerializer
from outfits.serializers import OutfitSerializer

class CategoryViewSet(ModelViewSet):
    majorcategory_queryset = MajorCategory.objects.all()
    minorcategory_queryset = MinorCategory.objects.all()
    majorcategory_serializer = MajorCategorySerializer
    minorcategory_serializer = MinorCategorySerializer

    
    

# Create your views here.
class ClothesViewSet(ModelViewSet):
    queryset = Clothes.objects.all()
    majorcategory_queryset = MajorCategory.objects.all()
    minorcategory_queryset = MinorCategory.objects.all()
    def get_serializer_class(self):
        if self.action == 'list' or self.action == 'retrieve':
            return ClothesRetrieveSerializer
        return ClothesSerializer

    @action(detail=True, methods=['get'], url_path=r'outfits')
    def outfit_of_clothes(self, request, pk):
        clothes_object = self.get_object()
        queryset = clothes_object.in_outfit.all()
        count = queryset.count()
        serializer = OutfitSerializer(queryset, context=self.get_serializer_context(), many=True)
        data = {
            "count": count,
            "results": serializer.data
        }
        return Response(data)

    @action(detail=False, methods=['get'], url_path=r'list/(?P<user_id>[^/.]+)')
    def user_clothes(self, request, user_id):
        params = request.query_params
        queryset = self.get_queryset().filter(user=user_id).order_by('-created_at')

        if 'major' in params:
            queryset = queryset.filter(major_category=params['major']).order_by('-created_at')
        
        count = queryset.count()
        serializer = ClothesSerializer(queryset, context=self.get_serializer_context(), many=True)
        data = {
            "count" : count,
            "results" : serializer.data
        }
        return Response(data)

    @action(detail=False, methods=['get'], url_path=r'recommendation/random')
    def random_recommendation(self, request):
        queryset = self.get_queryset().filter(user=request.user.user_id)
        result_queryset = []
        major_list = ['top', 'bottoms', 'shoes', 'accessory', 'outwear', 'others']

        for i in major_list:
            major_queryset = queryset.filter(major_category__name_en=i).order_by('?').first()
            if major_queryset != None:
                result_queryset.append(major_queryset)

        serializer = ClothesSerializer(result_queryset, context=self.get_serializer_context(), many=True)
        results_dict = {}.fromkeys(major_list)
        for i in serializer.data:
            results_dict[major_list[int(i['major_category']) - 1]] = i

        data = {
            "results" : results_dict
        }
        return Response(data)

    @action(detail=False, methods=['get'], url_path=r'stats/(?P<user_id>[^/.]+)')
    def user_clothes_stats(self, request, user_id):
        queryset = self.get_queryset().filter(user=user_id)        
        total_count = queryset.count()

        total_consumption = 0
        price_list = queryset.exclude(price=None).values('price')
        for i in price_list:
            total_consumption += i['price']
        average_consumption = total_consumption / (len(price_list))
        
        fit_count = queryset.exclude(fit='').values('fit').annotate(count=Count('fit')).order_by('-count')
        color_count = queryset.values('color').annotate(count=Count('color')).order_by('-count')
        brand_count = queryset.values('brand').annotate(count=Count('brand')).order_by('-count')
        
        category_count = []
        category_value = queryset.values('major_category').annotate(count=Count('major_category'))
        for i in category_value:
            new_category_value = {'major_category': self.majorcategory_queryset.filter(id=i['major_category']).values('name_en').get()['name_en'], 'count':i['count']}
            category_count.append(new_category_value)

        data = {
            "total_consumption" : int(total_consumption),
            "average_consumption" : int(average_consumption),
            "total_count" : total_count,
            "category_count" : category_count,
            "top_fit": fit_count[0]['fit'],
            "fit_count" : fit_count,
            "color_count" : color_count,
            "brand_count" : brand_count,
        }
        return Response(data)

        
    @action(detail=False, methods=['get'], url_path=r'stats/(?P<user_id>[^/.]+)/(?P<major_category>[a-z]+)')
    def user_clothes_stats_major(self, request, user_id, major_category):
        majorcategory_list = [i['name_en'] for i in self.majorcategory_queryset.values()]
        if major_category not in majorcategory_list:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            queryset = self.get_queryset().filter(user=user_id,
                major_category=self.majorcategory_queryset.filter(name_en=major_category).values('id').get()['id'])
            total_count = queryset.count()

            total_consumption = 0
            price_list = queryset.exclude(price=None).values('price')
            for i in price_list:
                total_consumption += i['price']            
            average_consumption = total_consumption / len(price_list)
            
            fit_count = queryset.exclude(fit='').values('fit').annotate(count=Count('fit')).order_by('-count')
            color_count = queryset.values('color').annotate(count=Count('color')).order_by('-count')
            brand_count = queryset.values('brand').annotate(count=Count('brand')).order_by('-count')

            category_count = []
            category_value = queryset.values('minor_category').annotate(count=Count('minor_category'))
            for i in category_value:
                new_category_value = {'minor_category': self.minorcategory_queryset.filter(id=i['minor_category']).values('name_en').get()['name_en'], 'count':i['count']}
                category_count.append(new_category_value)
                
            data = {
                "total_consumption" : int(total_consumption),
                "average_consumption" : int(average_consumption),
                "total_count" : total_count,
                "category_count" : category_count,
                "top_fit": fit_count[0]['fit'],
                "fit_count" : fit_count,
                "color_count" : color_count,
                "brand_count" : brand_count,
            }
            return Response(data)   
    
    @action(detail=True, methods=['get'], url_path=r'likes')
    def clothes_likes(self, request, pk):
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


class ClothesBulkView(APIView):
    def get(self, request, pk_ids):
        print(pk_ids)
        ids = [int(pk) for pk in pk_ids.split(',')]
        contactObject = Clothes.objects.filter(id__in=ids)
        serializeContactObject = ClothesSerializer(contactObject, many=True)
        return Response(serializeContactObject.data)

    def delete(self, request, pk_ids):
        ids = [int(pk) for pk in pk_ids.split(',')]
        for i in ids:
            get_object_or_404(Clothes, pk=i).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)