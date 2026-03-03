from django.urls import path
<<<<<<< HEAD
from . import views

urlpatterns = [
    path('', views.home, name='home'),
=======

from .views import helloword

urlpatterns = [
    path('', helloword.helloworld, name='helloworld'),
>>>>>>> 8c1b8fb664aa617b43c868b4db589ed14cac16c6
]