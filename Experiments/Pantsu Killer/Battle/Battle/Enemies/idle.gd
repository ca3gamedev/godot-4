extends Node

var change = 0.0
var timer = 0.0

func _ready():
	timer = randf_range(0.5, 1.5)
	
func Transition(delta):
	change += delta
	
	if change > timer :
		change = 0
		var x = randf_range(-1, 1)
		var y = randf_range(-1, 1)
		%WALK.angle = Vector2(x, y)
		$"../".current = $"../".get_node("WALK")
		%Ani.play("WALK")
	

func Update(delta):
	pass

func Physics(delta):
	pass
