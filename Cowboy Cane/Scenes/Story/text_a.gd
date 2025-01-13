extends Node2D

@export var id : int
@export var max_pages : int
@export var target : Node2D

@export var idle : bool
@export var Next : String

func Change():
	if id < max_pages:
		id += 1
	if id == max_pages:
		Variables.ChangeScene(Next)
	$"../../../Story".frame = id
	target = get_node(str(id))

func _process(delta):
	
	if Input.is_action_just_released("SPACE") and idle:
		idle = false
		$Timer.start(1.5)
		Change()
	
	$Parent.global_position = lerp($Parent.global_position, target.global_position, delta)


func _on_timer_timeout():
	idle = true
