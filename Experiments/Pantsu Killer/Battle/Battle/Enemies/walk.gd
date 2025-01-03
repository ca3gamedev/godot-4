extends Node

var change = 0.0
var timer = 0.0

var angle = Vector2(0, 0)
@export var walk_speed : float

func _ready():
	timer = randf_range(1, 5)

func Transition(delta):
	change += delta
	
	if change > timer :
		change = 0
		$"../".current = $"../".get_node("IDLE")
		%Ani.play("IDLE")

func Update(delta):
	pass

func Physics(delta):
	var speed = (delta * angle).normalized() * walk_speed
	$"../..".move_and_collide(speed)
