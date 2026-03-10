# views.py
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from decimal import Decimal
from appSite.models import User, Game, Purchase, Review

@login_required
def my_library(request):
    user, created = User.objects.get_or_create(
        username=request.user.username,
        defaults={'email': request.user.email, 'balance': 0.0}
    )

    if request.method == "POST":
        amount = request.POST.get("amount")
        try:
            amount_decimal = Decimal(amount)
            if amount_decimal > 0:
                user.balance += amount_decimal
                user.save()
        except:
            pass

        return redirect('my_library')

    purchased_games = Game.objects.filter(purchase__user=user)

    reviewed_game_ids = Review.objects.filter(user=user).values_list('game_id', flat=True)

    return render(request, 'gameshop/library.html', {
        'user': user,
        'purchased_games': purchased_games,
        'reviewed_game_ids': reviewed_game_ids
    })