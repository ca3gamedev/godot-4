extends Node

var computer_visible = false

func _ready():
	%ComputerLabel.hide()

func _on_computer_body_entered(body):
	if body.is_in_group("PLAYER"):
		%ComputerLabel.show()
		computer_visible = true


func _on_computer_body_exited(body):
	if body.is_in_group("PLAYER"):
		%ComputerLabel.hide()
		computer_visible = false
