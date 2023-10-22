extends Node

@export var walk : bool
@export var timerdelay : float

@export var vel : Vector3
@onready var root = $".."

@export var speed : float

func _ready():
	
	speed = randf_range(0.5, 1.5)
	
	timerdelay = randf_range(3,  5)
	$Timer.start(timerdelay)

func _on_timer_timeout():
	walk = !walk
	
	var tmp = Vector2.ZERO
	tmp.x = randf_range(-1, 1)
	tmp.y = randf_range(-1, 1)
	
	var target = root.global_position + Vector3(tmp.x, 0, tmp.y)
	vel = root.global_position - target * speed
	vel.y = -1
	
	if randf_range(0, 4) > 2.5:
		vel = Vector3.ZERO
	
