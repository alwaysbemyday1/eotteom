import base64

from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from .models import User

class UserSerializer(serializers.ModelSerializer):
    image_memory = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = '__all__'

    def create(self, validated_data):
        email = validated_data.get('email')
        password = validated_data.get('password')
        user = User(
            email=email
        )
        user.set_password(password)
        user.save()
        return user

    def get_image_memory(request, user : User):
        if user.image != None and user.image != '':
            with open(f'media/{user.image.name}', mode='rb') as loadedfile:
                return base64.b64encode(loadedfile.read())
        else:
            return
