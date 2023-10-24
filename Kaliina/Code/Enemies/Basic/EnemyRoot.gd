extends Node3D

@export var HP : int
@export var Damage : int

@onready var Lifebar = $EnemyGUI/SubViewport/EnemyGUI/HP

func _ready():
	await  get_tree().process_frame
	Lifebar.max_value = HP
	Lifebar.value = HP


func HIT(damage):
	HP -= damage
	Lifebar.value = HP
	$EnemyM.HIT()
	
	if HP < 1:
		self.queue_free()
