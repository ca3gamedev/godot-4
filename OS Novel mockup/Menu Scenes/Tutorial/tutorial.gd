extends Node2D


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Comiket Level/comiket_level_gui.tscn")
