from django.urls import path

from .views import helloword

urlpatterns = [
    path('', helloword.helloworld, name='helloworld'),
]