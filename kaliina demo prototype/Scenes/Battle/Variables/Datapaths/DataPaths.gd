extends Node

@export var Pacifica : CharacterBody2D
@export var Rosa : CharacterBody2D
@export var MyGUI : Node2D
@export var EnemyManager : Node2D

func Start(paths):
	Pacifica = paths.Pacifica
	Rosa = paths.Rosa
	MyGUI = paths.MyGUI
	EnemyManager = paths.EnemyManager
