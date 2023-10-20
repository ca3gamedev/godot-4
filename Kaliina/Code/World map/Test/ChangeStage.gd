extends Node

@export var Scenes : Dictionary

func _process(delta):
	
	if Input.is_action_just_released("A"):
		
		if %Code.idle:
			match(%Code.stage):
				0: get_tree().change_scene_to_file(Scenes["DialogTest"])
				1: get_tree().change_scene_to_file(Scenes["TestBattle"])
