extends Node

func _ready():
	
	if Variables.ending_battle:
		%Player.global_position = %PCPOS.global_position
		%Player.global_rotation.y = 0
		%Player.get_node("FSM").dir.y = -1
	
	if Variables.entering_office:
		%Player.global_position = %OFFICEDOOR.global_position
		%Player.global_rotation.y = 180
		%Player.get_node("FSM").dir.y = 1
