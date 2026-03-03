from django.urls import path
from appSite.views import views

urlpatterns = [
    path('', views.home, name='home'),
    path('games/', views.games_list, name='game_list')
]