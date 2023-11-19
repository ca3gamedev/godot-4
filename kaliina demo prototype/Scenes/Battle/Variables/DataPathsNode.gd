extends Node

@export var Player : CharacterBody2D
@export var Camera : Camera2D
@export var GUI : Node2D

func _ready():
	Variables.get_node("DataPaths").Start(self)
