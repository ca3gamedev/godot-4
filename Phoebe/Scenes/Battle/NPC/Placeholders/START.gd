extends Node


func Update(delta):
	pass

func Physics(delta):
	pass


func _on_start_timer_timeout():
	%FSM.current = %FSM.get_node("WALK")
