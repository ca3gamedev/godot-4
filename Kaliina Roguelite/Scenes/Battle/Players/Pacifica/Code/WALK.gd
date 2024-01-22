extends Node

var dir = Vector2i.DOWN
var target = Vector2.ZERO

func Transition():
	pass

func Update(delta):
	pass

func Physics(delta):
	pass

func Start():
	var dir = %MyInput.GetWalk().x
	%FSM.get_parent().global_position = %FSM.get_parent().GetTarget(dir + %FSM.get_parent().pos)
	%FSM.current = %FSM.get_node("IDLE")
