from django.db import models

class User(models.Model):
	employeeid = models.CharField(max_length=20)
	fullname = models.CharField(max_length=200)
	firstname = models.CharField(max_length=200)
	lastname = models.CharField(max_length=200)
	email = models.CharField(max_length=200)
	def __str__(self):
		return self.fullname


class Device(models.Model):
	manufacturer = models.CharField(max_length=200)
	serial = models.CharField(max_length=200)
	model = models.CharField(max_length=200)
	description = models.CharField(max_length=200)
	devicetype = models.CharField(max_length=200)
	status = models.CharField(max_length=200)
	osversion = models.CharField(max_length=200)
	checkedoutby = models.ForeignKey(User, blank=True, null=True, on_delete=models.SET_NULL)
	timecheckedout = models.DateTimeField('date checked out', blank=True, null=True)
	def __str__(self):
		return self.description

class CheckoutLog(models.Model):
	checkedoutby = models.ForeignKey(User, on_delete=models.CASCADE)
	device = models.ForeignKey(Device, on_delete=models.CASCADE)
	action = models.CharField(max_length=200)
	time = models.DateTimeField('date action occurred')
	def __str__(self):
		return "%s %s %s " % (self.checkedoutby.fullname, self.action, self.device.description)