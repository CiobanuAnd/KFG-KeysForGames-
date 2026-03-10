from django.urls import path
from appSite.views import views
from appSite.views import registerLogin
from appSite.views import buybutton
from appSite.views import user_library
from appSite.views import add_review
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('', views.home, name='home'),
    path('register/', registerLogin.register_view, name='register'),
    path('login/', registerLogin.login_view, name='login'),
    path("buy/<int:game_id>/", buybutton.buy_product, name="buy_product"),
    path('library/', user_library.my_library, name='library'),
    path('logout/', auth_views.LogoutView.as_view(next_page='home', redirect_field_name=''), name='logout'),
    path('add_review/<int:game_id>/', add_review.add_review, name='add_review'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    
