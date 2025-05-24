extends Node

@export var coins : int

@export var max_manga : int = 1
@export var max_novel : int = 1

@export var x_pos : int = 1
@export var rot_angle : int = 0

var Root : Node2D


func ChangeScene(scene):
	match(scene):
		"Sailor Moon Gallery" : get_tree().change_scene_to_file("res://Scenes/Gallery/gallery_frame.tscn")
		"Sailor Moon Novels" : get_tree().change_scene_to_file("res://Scenes/Novel/novels_hub.tscn")
		"Sailor Moon OneShot" : get_tree().change_scene_to_file("res://Scenes/OneShot/one_shot.tscn")

func RETURN():
	get_tree().change_scene_to_file("res://Scenes/Comiket Level/comiket_level_gui.tscn")
