from django.shortcuts import render
from appSite.models import Game

# Create your views here.
def home(request):
    #return render(request, 'gameshop/home.html')
    games = Game.objects.all()
    return render(request, "gameshop/home.html", {"games": games})

def games_list(request):
    all_games = Game.objects.all().select_related('buyer')
    return render(request, 'gameshop/games.html', {'games': all_games})
