from django.contrib import admin
from .models import Game, User, Review

# Register your models here.
admin.site.register([User, Game, Review])