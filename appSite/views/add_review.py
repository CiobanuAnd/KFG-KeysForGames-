from django.shortcuts import get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from appSite.models import Game, Review, User

@login_required
def add_review(request, game_id):
    # Get the game object
    game = get_object_or_404(Game, id=game_id)
    user = get_object_or_404(User, username=request.user.username)

    if request.method == "POST":
        text = request.POST.get("text")
        rating = request.POST.get("rating")

        if text and rating:
            try:
                rating = int(rating)
                if 1 <= rating <= 5:
                    # Only create review if the user hasn't reviewed this game
                    if not Review.objects.filter(user=user, game=game).exists():
                        Review.objects.create(
                            user=user,
                            game=game,
                            text=text,
                            rating=rating
                        )
            except ValueError:
                pass  # ignore invalid ratings

    return redirect('library')