from django.shortcuts import get_object_or_404, redirect
from appSite.models import User, Game, Purchase
from django.contrib.auth.decorators import login_required

@login_required
def buy_product(request, game_id):

    user = get_object_or_404(User, username=request.user.username)

    game = get_object_or_404(Game, id=game_id)

    if Purchase.objects.filter(user=user, game=game).exists():
        return redirect('already_owned')

    if user.balance < game.price:
        return redirect('not_enough_money')

    user.balance -= game.price
    user.save()

    Purchase.objects.create(user=user, game=game)

    user.library.add(game)

    return redirect('success')