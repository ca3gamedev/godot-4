extends Node2D

@export var id : int
@export var max_id : int
@export var intro_name : String
@export var ending_name : String
@onready var target : Vector2


func _process(delta):
	target = GetTarget()
	
	%Camera2D.global_position = lerp(%Camera2D.global_position, target, delta*3)
	
	if Input.is_action_just_released("LEFT") and id > 0 :
		id -= 1
	if Input.is_action_just_released("RIGHT") and id < max_id:
		id += 1
	

func GetTarget():
	var mytarget = Vector2.ZERO
	
	var name = str(id)
	mytarget = get_node(name).global_position
	
	return mytarget

