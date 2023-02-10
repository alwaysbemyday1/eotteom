from .models import Clothes, MajorCategory, MinorCategory
from eotteom_lib.encode_image import Base64Encoding
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
    image_memory = serializers.SerializerMethodField()

    class Meta:
        model = Clothes
        fields = ('user', 'name', 'major_category', 'minor_category', 'brand', 'color', 'size', 'price', 'image', 'image_memory')

    def get_image_memory(self, clothes: Clothes):
        return Base64Encoding.encoding_image(clothes)

class ClothesSerializer(serializers.ModelSerializer):
    image_memory = serializers.SerializerMethodField()
    class Meta:
        model = Clothes
        fields = '__all__'

    def get_image_memory(self, clothes: Clothes):
        return Base64Encoding.encoding_image(clothes)