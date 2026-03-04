from django.urls import path
from appSite.views import views
from appSite.views import registerLogin
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.home, name='home'),
    path('games/', views.games_list, name='game_list'),
    path("register/", registerLogin.register_view, name="register"),
    path("login/", registerLogin.login_view, name="login"),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
]