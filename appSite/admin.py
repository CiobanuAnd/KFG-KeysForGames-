from django.contrib import admin
from .models import Game, User, Review, Purchase

# Register your models here.
admin.site.register([User, Game, Review, Purchase])