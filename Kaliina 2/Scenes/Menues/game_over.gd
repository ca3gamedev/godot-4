extends Node2D


func _on_return_button_up() -> void:
	
	get_tree().change_scene_to_file("res://Scenes/Menues/title.tscn")
