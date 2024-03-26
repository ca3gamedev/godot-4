extends Area3D

@onready var wait = false


func _on_body_entered(body):
	if wait:
		%WAIT.near = true
		%Dialogs.show()


func _on_body_exited(body):
	if wait:
		%WAIT.near = false
		%Dialogs.hide()
