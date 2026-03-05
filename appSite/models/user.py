from django.db import models
from typing import List

class User(models.Model):
    username = models.CharField(max_length=50, unique=True)
    email = models.EmailField(unique=True)
    balance = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    library = models.ManyToManyField('appSite.game', blank=True)

    def __str__(self):
        return self.username