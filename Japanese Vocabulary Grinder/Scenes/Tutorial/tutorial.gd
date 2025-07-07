extends Node2D

@export var current : int
@export var target : Vector2

func _ready():
	UpdateTarget()

func _process(delta):
	
	if Input.is_action_just_released("UP") or Input.is_action_just_released("LEFT"):
		if current > 0:
			current -= 1
			UpdateTarget()
	
	if Input.is_action_just_released("DOWN") or Input.is_action_just_released("RIGHT"):
		if current < 5:
			current += 1
			UpdateTarget()
	
	$Camera2D.global_position = $Camera2D.global_position.slerp(target, delta * 4)
	
	if Input.is_action_just_released("A") and current == 5:
		Variables.ChangeScene("Title")


func UpdateTarget():
	target = $Pages.get_node(str(current)).global_position
