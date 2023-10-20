extends Node

@export var walk : bool


func _process(delta):
	
	if Input.is_action_just_released("C"):
		walk = !walk
