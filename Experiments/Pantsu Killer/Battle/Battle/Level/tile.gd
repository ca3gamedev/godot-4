extends Node2D

func _ready():
	var new = randi_range(0, 2)
	new = randi_range(0, 2)
	$AnimatedSprite2D.frame = new
