from django.contrib import admin

from .models import *

admin.site.register(Device)
admin.site.register(CheckoutLog)
admin.site.register(User)