extends Button

@export var Next : String



func _on_button_up():
	get_tree().change_scene_to_file(Next)
