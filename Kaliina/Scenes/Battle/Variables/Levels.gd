extends Node

@onready var level1_1  = "res://Scenes/Battle/Scene/Levels/01/01.tscn"

func GetLevel(level):
	match(level):
		"11" : return level1_1
