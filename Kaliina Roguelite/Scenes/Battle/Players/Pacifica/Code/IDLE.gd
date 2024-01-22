extends Node


func Transition():
	if %MyInput.GetWalk() != Vector2i.ZERO:
		%FSM.current = %FSM.get_node("WALK")
		%FSM.current.Start()

func Update(delta):
	pass

func Physics(delta):
	pass

func Start():
	pass
