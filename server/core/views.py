from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import AllowAny

from .models import User
from .serializers import UserSerializer

# Create your views here.
class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer