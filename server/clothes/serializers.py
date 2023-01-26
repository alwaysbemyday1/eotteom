from .models import Clothes, MajorCategory, MinorCategory

from rest_framework import serializers

class MajorCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = MajorCategory
        fields = '__all__'

class MinorCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = MinorCategory
        fields = '__all__'

class ClothesRetrieveSerializer(serializers.ModelSerializer):
    major_category = MajorCategorySerializer()
    minor_category = MinorCategorySerializer()

    class Meta:
        model = Clothes
        fields = ('user', 'name', 'major_category', 'minor_category', 'brand', 'color', 'size', 'price')

class ClothesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Clothes
        fields = '__all__'