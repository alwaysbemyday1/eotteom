from .models import Outfits

from rest_framework import serializers

class OutfitsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Outfits
        fields = '__all__'