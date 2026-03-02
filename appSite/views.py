from django.shortcuts import render
from django.http import HttpRequest

# Create your views here.

def helloworld(request):
    return HttpRequest("Hello Wolrd!")