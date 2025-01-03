extends Node

func _process(delta):
	
	if Input.is_action_just_released("CIRCLE"):
		$"../".GetInput(0)
	if Input.is_action_just_released("CROSS"):
		$"../".GetInput(1)
	if Input.is_action_just_released("SQUARE"):
		$"../".GetInput(2)
	if Input.is_action_just_released("TRIANGLE"):
		$"../".GetInput(3)
