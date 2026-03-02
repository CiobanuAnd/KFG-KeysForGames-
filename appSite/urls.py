from django.urls import path
from . import views

urlpatterns = [
    path('appSite/', views.helloworld, name='hello world'),
]