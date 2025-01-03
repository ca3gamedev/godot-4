extends Node

@export var dir : int

func _process(delta):
	
	if Input.is_action_just_released("LEFT") and dir > 0:
		dir -= 1
		%Anim.frame = dir
	if Input.is_action_just_released("RIGHT") and dir < 2:
		dir += 1 
		%Anim.frame = dir
