extends Button

@export var Next : String

func _on_pressed():
	
	Variables.ChangeScene(Next)
