extends Node2D

func _ready():
	
	for i in get_children():
		i.disabled = true
	
	for i in range(CurrentLevel.id):
		get_node("Continue" + str(i+1)).disabled = false
