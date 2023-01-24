from .models import Outfit

from rest_framework import serializers

class OutfitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Outfit
        fields = '__all__'