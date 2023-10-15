extends "res://Code/Players/Päcifica/FSM/basic.gd"

@onready var AnimState  = %AnimsTree.get("parameters/playback")

func Start():
	AnimState.travel("MELEE")
	%AnimsTree.set("parameters/MELEE/blend_position", Vector2(0.5, 0))
