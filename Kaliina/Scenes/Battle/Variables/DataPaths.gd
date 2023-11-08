extends Node

@export var Player : CharacterBody2D
@export var Camera : Camera2D
@export var GUI : Node2D


func Start(datapaths):
	
	Player = datapaths.Player
	Camera = datapaths.Camera
	GUI = datapaths.GUI
