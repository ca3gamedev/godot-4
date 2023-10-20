extends Node3D

@export var onager01 : StaticBody3D
@export var onager02 : StaticBody3D

func SpawnBoulder():
	match Variables.get_node("CombatVars").boulderid:
		0: onager01.SpawnBoulder(Variables.get_node("CombatVars").boulderforce)
		1: onager02.SpawnBoulder(Variables.get_node("CombatVars").boulderforce)
