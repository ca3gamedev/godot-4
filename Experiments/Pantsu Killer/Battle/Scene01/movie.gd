extends Node

var end : bool

func _process(delta):
	
	if not end:
		if Input.is_action_just_released("Space"):
			$Start.start(2)
			%Sleep.hide()
			%Player1.show()
			%Label.text = "Press left and right or A D arrows to look"
	else:
		if Input.is_action_just_released("Space"):
			Variables.ChangeScene("02")


func _on_start_timeout():
	%Label.text = "Press SPACE or Enter to continue"
	end = true
