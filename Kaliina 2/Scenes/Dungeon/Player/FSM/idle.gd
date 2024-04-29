extends Node

func Transition():
	
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN"):
		%FSM.current = %FSM.get_node("WALK")

func Update(_delta):
	pass

func Physics(_delta):
	pass
