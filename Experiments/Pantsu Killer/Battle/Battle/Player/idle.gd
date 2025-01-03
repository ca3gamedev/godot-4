extends Node

func _ready():
	%Anim.set("parameters/MOVE/blend_position", 0)

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN"):
		$"../".current = $"../".get_node("WALK")
	
	if Input.is_action_pressed("PUNCH"):
		$"../".current = $"../".get_node("PUNCH")
		$"../".current.Start()


func Update(delta):
	pass
	
func Physics(delta):
	pass
