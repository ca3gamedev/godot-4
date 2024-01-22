extends Node2D

@export var level : int

func _on_area_2d_body_entered(body):
	if body.name == "Pacifica":
		$"../../../".SummonBattle(level)
		queue_free()
