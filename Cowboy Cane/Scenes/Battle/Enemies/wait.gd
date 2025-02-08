extends Node

func Update(delta):
	pass

func Physics(delta):
	pass

func Start():
	%Ani.set("parameters/conditions/walk", false)
	%Ani.set("parameters/conditions/idle", true)
	%Ani.set("parameters/conditions/hurt", false)
	%Ani.set("parameters/conditions/attack", false)
