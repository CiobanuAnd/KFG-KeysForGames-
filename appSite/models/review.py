from django.db import models
from .user import User
from django.core.validators import MaxValueValidator, MinValueValidator 

class Review(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    text=models.TextField(max_length=300)
    nota=models.PositiveIntegerField(default=5, validators=[MinValueValidator(1), MaxValueValidator(5)])

    def __str__(self):
        return self.text
        