extends Node2D

@export var id : int
@export var max_id : int
@export var next : String

func _process(delta):
	
	if id > 0 and Input.is_action_just_released("LEFT"):
		id -= 1
		%Camera2D.target = get_node(str(id)).global_position
	if id < max_id and Input.is_action_just_released("RIGHT"):
		id += 1
		%Camera2D.target = get_node(str(id)).global_position
	
	if id == max_id and Input.is_action_just_released("Space"):
		Variables.ChangeScene(next)
