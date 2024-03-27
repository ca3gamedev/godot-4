extends Area3D

@onready var wait = false
@onready var sleep = false


func _on_body_entered(body):
	
	if not body.is_in_group("PLAYER"):
		return
	
	if wait:
		%WAIT.near = true
		%Dialogs.get_node("Dialog").text = %Dialogs.Help
		%Dialogs.show()
	
	if sleep:
		%SLEEP.near = true
		%Dialogs.get_node("Dialog").text = %Dialogs.Meds
		%Dialogs.show()


func _on_body_exited(body):
	if wait:
		%WAIT.near = false
		%Dialogs.hide()
	
	if sleep:
		%SLEEP.near = true
		%Dialogs.hide()
