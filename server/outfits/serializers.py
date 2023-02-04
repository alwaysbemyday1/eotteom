import base64

from .models import Outfit

from rest_framework import serializers

class OutfitSerializer(serializers.ModelSerializer):
    image_memory = serializers.SerializerMethodField()
    class Meta:
        model = Outfit
        fields = ('id', 'user', 'name', 'image', 'clothes', 'style', 'date', 'season', 'likes', 'created_at', 'is_public', 'is_delete', 'image_memory')

    def get_image_memory(request, outfit : Outfit):
        with open(outfit.image.name, mode='rb') as loadedfile:
            return base64.b64encode(loadedfile.read())