from django.urls import path
from appSite.views import views
from appSite.views import registerLogin

urlpatterns = [
    path('', views.home, name='home'),
    path('games/', views.games_list, name='game_list'),
    path("register/", views.register_view, name="register"),
    path("login/", views.login_view, name="login"),
]