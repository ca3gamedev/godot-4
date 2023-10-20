extends Node2D

@export var Next : String

@export var UseAButton : bool

func _process(delta):
	
	if UseAButton:
		if Input.is_action_just_released("A"):
			get_tree().change_scene_to_file(Next)
