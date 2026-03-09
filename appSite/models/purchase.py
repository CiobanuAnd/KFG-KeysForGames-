from django.db import models
from .user import User
from .game import Game

class Purchase(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    purchase_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('user', 'game')

    def __str__(self):
        return f"{self.user.username} bought {self.game.title}"