extends Node3D

@export var HP : int

@onready var Lifebar = $EnemyGUI/SubViewport/EnemyGUI/HP

func _ready():
	Lifebar.max_value - HP
	Lifebar.value = HP


func HIT(damage):
	HP -= damage
	Lifebar.value = HP
	$EnemyM.HIT()
