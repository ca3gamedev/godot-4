extends Node

func _process(delta):
	
	if Input.is_action_just_released("SPACE") and %ComputerText.computer_visible:
		Variables.ChangeScene("BATTLE BEGIN")
