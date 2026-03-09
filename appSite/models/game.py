from django.db import models

#from .user import User

class Game(models.Model):
    title = models.CharField(max_length=200)
    price = models.DecimalField(max_digits=7, decimal_places=2)
    #buyer = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    #purchase_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title