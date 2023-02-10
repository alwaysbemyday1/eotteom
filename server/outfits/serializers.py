from .models import Outfit
from eotteom_lib.encode_image import Base64Encoding

from rest_framework import serializers

class OutfitSerializer(serializers.ModelSerializer):
    image_memory = serializers.SerializerMethodField()
    class Meta:
        model = Outfit
        fields = '__all__'

    def get_image_memory(self, outfit : Outfit):
        return Base64Encoding.encoding_image(outfit)