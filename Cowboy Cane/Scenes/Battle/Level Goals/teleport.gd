extends Area3D

@export var Next : String

func _ready():
	Variables.Teleport = self


func _on_area_entered(area):
	
	if area.is_in_group("PLAYER"):
		Variables.ChangeScene(Next)
