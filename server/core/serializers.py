from rest_framework import serializers
from eotteom_lib.encode_image import Base64Encoding

from .models import User

class UserRegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type':'password'}, write_only=True)

    class Meta:
        model = User
        fields = ['email', 'password', 'password2','gender']
        extra_kwargs = {
            'password': {
                'write_only':True
            }
        }

    def save(self, request):
        user = User(
            email=self.validated_data['email'],
            gender=self.validated_data['gender'],
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password != password2:
            raise serializers.ValidationError({'password':'Passwords must match.'})
        user.set_password(password)
        user.save()
        return user

class UserSerializer(serializers.ModelSerializer):
    image_memory = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = '__all__'

    def get_image_memory(request, user : User):
        return Base64Encoding.encoding_image(user)
