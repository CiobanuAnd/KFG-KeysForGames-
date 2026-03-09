from django.shortcuts import get_object_or_404, redirect
from appSite.models import User, Game, Purchase
from django.contrib.auth.decorators import login_required
from django.contrib import messages

@login_required
def buy_product(request, game_id):

    if request.method != "POST":
        return redirect('home')

    user = get_object_or_404(User, username=request.user.username)
    game = get_object_or_404(Game, id=game_id)

    # already owned
    if Purchase.objects.filter(user=user, game=game).exists():
        messages.info(request, "You already own this game!")
        return redirect('home')
    
    # insufficient balance
    if user.balance < game.price:
        messages.info(request, "Not enough money")
        return redirect('home')

    # subtract balance
    user.balance -= game.price
    user.save()

    # record purchase
    Purchase.objects.create(user=user, game=game)

    # add to library
    user.library.add(game)

    return redirect('home')