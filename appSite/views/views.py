from django.shortcuts import render
from appSite.models import Game

# Create your views here.
def home(request):
    from appSite.models.user import User as CustomUser
    games = Game.objects.all()
    if request.user.is_authenticated:
        custom_user = CustomUser.objects.get(username=request.user.username)
    else:
        custom_user = None
    return render(request, "gameshop/home.html", {"games": games, "custom_user": custom_user})


def games_list(request):
    all_games = Game.objects.all().select_related('buyer')
    return render(request, 'gameshop/games.html', {'games': all_games})
