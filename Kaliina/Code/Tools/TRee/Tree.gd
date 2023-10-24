extends StaticBody3D

@export var HP : int

func _ready():
	$"../HP/SubViewport/HOBar".get_node("ProgressBar").max_value = HP
	$"../HP/SubViewport/HOBar".get_node("ProgressBar").value = HP

func HIT(damage):
	HP -= damage
	$"../HP/SubViewport/HOBar".get_node("ProgressBar").value = HP
	
	if HP < 1:
		$"..".queue_free()
