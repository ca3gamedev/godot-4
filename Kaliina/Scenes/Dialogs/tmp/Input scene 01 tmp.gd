extends Node2D


@export var id : int
@export var maxid : int

@onready var target = %pages.get_node("1").global_position

func _process(delta):
	
	if Input.is_action_just_released("RIGHT") and id < maxid-1:
		id += 1
	
	if Input.is_action_just_released("LEFT") and id >= 2:
		id -= 1
	
	target = %pages.get_node(str(id)).global_position
	%Camera2D.global_position = %Camera2D.global_position.slerp(target, 0.1)
