from rest_framework.serializers import ModelSerializer
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from .models import User

class UserSerializer(ModelSerializer):
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

