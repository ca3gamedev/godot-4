extends Node

func _ready():
	%Ani.set("parameters/MOVE/blend_position", $"../".dir * 0.5)

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		$"../".current = $"../".get_node("WALK")
	

func Update(delta):
	pass

func Physics(delta):
	pass
