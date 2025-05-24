extends Node2D

func _ready() -> void:
	Menue.hide()
	MenueButton.hide()
	Menue.HIDECOIN()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu Scenes/Tutorial/tutorial.tscn")
