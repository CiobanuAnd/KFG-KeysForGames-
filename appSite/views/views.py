from django.shortcuts import render
from appSite.models import Game

# Create your views here.
def home(request):
    return render(request, 'gameshop/home.html')

def games_list(request):
    all_games = Game.objects.all().select_related('buyer')
    return render(request, 'gameshop/games.html', {'games': all_games})