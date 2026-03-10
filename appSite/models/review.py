from django.db import models
from .user import User
from .game import Game  # assuming you have a Game model
from django.core.validators import MaxValueValidator, MinValueValidator 

class Review(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    game = models.ForeignKey(Game, on_delete=models.CASCADE, related_name='reviews', null=True, blank=True)  # <- allow null
    text = models.TextField(max_length=300)
    rating = models.PositiveIntegerField(
        default=5,
        validators=[MinValueValidator(1), MaxValueValidator(5)]
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        unique_together = ('user', 'game')
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.user} - {self.game} ({self.rating})"