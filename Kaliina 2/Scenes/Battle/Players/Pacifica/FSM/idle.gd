extends Node

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT"):
		%FSM.current = %FSM.get_node("WALK")
	if Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN"):
		%FSM.current = %FSM.get_node("WALK")
	if Input.is_action_just_released("CHANGE"):
		$"../../".Pacifica = !$"../../".Pacifica
		$"../../".ChangeSprite()
	
func Update(delta):
	pass

func Physics(delta):
	pass
