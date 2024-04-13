extends Node

func Transition():
	
	if Input.is_action_just_released("CHANGE"):
		%WALK.Target = DataPath.Pacifica.global_position
		%FSM.current = %FSM.get_node("WALK")

func Update(delta):
	pass

func Physics(delta):
	pass
