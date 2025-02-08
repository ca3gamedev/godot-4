extends Node

func _ready():
	%Ani.set("parameters/MOVE/blend_position", Vector2.ZERO)

func Update(delta):
	
	var angle = %Ani.get("parameters/MOVE/blend_position")
	angle = lerp(angle, Vector2.ZERO, delta * 5)
	%Ani.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	pass

func Start():
	%Ani.set("parameters/conditions/hurt", false)
	%Ani.set("parameters/conditions/attack", false)
