from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib import messages
from appSite.models import User as AppUser

def register_view(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        email = request.POST["email"]

        if User.objects.filter(username=username).exists() or AppUser.objects.filter(username=username).exists():
            messages.error(request, "Username already exists")
            return redirect("register")

        user = User.objects.create_user(
            username=username,
            password=password
        )
        user.save()

        AppUser.objects.create(
             username = username,
             email = email,
             balance = 0.0
         )
        
        messages.success(request, 'Account created succesfully!')
        return redirect("login")

    return render(request, "gameshop/register.html")


def login_view(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, 'Login succesfully')
            return redirect("home")
        else:
            messages.error(request, "Invalid credentials")

    return render(request, "gameshop/login.html")