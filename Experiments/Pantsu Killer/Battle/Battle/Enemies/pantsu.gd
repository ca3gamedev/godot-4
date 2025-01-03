extends CharacterBody2D

@export var HP : int

func _ready():
	$HP.max_value = HP
	$HP.value = HP

func HIT():
	HP -= 1
	$HP.value = HP
	
	if HP < 1:
		Variables.GUI.KILL()
		self.queue_free()
