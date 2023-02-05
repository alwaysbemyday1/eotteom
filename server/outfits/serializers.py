import base64

from .models import Outfit

from rest_framework import serializers

class OutfitSerializer(serializers.ModelSerializer):
    image_memory = serializers.SerializerMethodField()
    class Meta:
        model = Outfit
        fields = '__all__'

    def get_image_memory(self, outfit : Outfit):
        if outfit.image != None and outfit.image != '':
            with open(f'media/{outfit.image.name}', mode='rb') as loadedfile:
                return base64.b64encode(loadedfile.read())
        else:
            return