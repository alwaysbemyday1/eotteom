import base64

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
    image_memory = serializers.SerializerMethodField()
    class Meta:
        model = Clothes
        fields = '__all__'

    def get_image_memory(self, clothes: Clothes):
        if clothes.image != None and clothes.image != '':
            with open(f'media/{clothes.image.name}', mode='rb') as loadedfile:
                return base64.b64encode(loadedfile.read())
        else:
            return