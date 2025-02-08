extends Node

@export var yasir : CharacterBody3D

@export var TOPLEFT : Marker2D
@export var BOTTOMRIGHT : Marker2D
@export var GUI : Node2D
@export var Camera : Camera3D
@export var camera_roam : bool

@export var roguelevelsid : int
@export var CoinManager : Node3D
@export var Teleport : Area3D
@export var coins : int
@export var keys : int
@export var HP : int

func GameOver():
	Music.Stop()
	get_tree().change_scene_to_file("res://Scenes/Menues/Game Over/game_over.tscn")

func ChangeScene(scene):
	Music.Stop()
	
	if scene == "Roguelike":
		roguelevelsid += 1
		if roguelevelsid > 3:
			roguelevelsid = 0
			get_tree().change_scene_to_file("res://Scenes/Story/Story B.tscn")
			return
	
	match(scene):
		"Intro" : get_tree().change_scene_to_file("res://Scenes/Story/Story A.tscn")
		"Level 1" : get_tree().change_scene_to_file("res://Scenes/Battle/Levels 3D Hand Made/Level 01.tscn")
		"Level 2" : get_tree().change_scene_to_file("res://Scenes/Battle/3D roguelike/3D roguelike.tscn")
		"Roguelike" : get_tree().change_scene_to_file("res://Scenes/Battle/3D roguelike/3D roguelike.tscn")
		"GAME OVER" : get_tree().change_scene_to_file("res://Scenes/Menues/Game Over/game_over.tscn")
		"Title" : get_tree().change_scene_to_file("res://Scenes/Menues/Title/title.tscn")
