extends Node

@export var BoulderManager : Node3D
@export var OnagerManager : Node3D

@export var Pacifica : CharacterBody3D
@export var MyGUI : Node2D
@export var EnemyBullets : Node3D
@export var HPCore : CharacterBody3D
@export var MyCamera : Camera3D


func _ready():
	await get_tree().process_frame
	Variables.get_node("Code/StartBattle").Start()
	Variables.get_node("DataPaths").SetPaths(self)
