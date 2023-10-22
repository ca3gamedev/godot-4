extends Node3D

@export var onager01 : StaticBody3D

func SpawnBoulder():
	onager01.SpawnBoulder(Variables.get_node("CombatVars").boulderforce)
