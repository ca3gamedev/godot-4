extends CharacterBody3D

func _ready():
	Variables.yasir = self

func HIT():
	
	%FSM.get_node("HURT").HIT()
	
