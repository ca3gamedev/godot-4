extends Node2D

@export var Butterfly : PackedScene

func _ready():
	SpawnBug()
	
func SpawnBug():
	var maxbugs = randi_range(1, 10)
	
	for i in maxbugs:
		var x = randf_range($TopLeft.global_position.x, $BottomRight.global_position.x)
		var y = randf_range($TopLeft.global_position.y, $BottomRight.global_position.y)
		
		var tmp
		tmp = Butterfly.instantiate()
		call_deferred("add_child", tmp) 
		tmp.global_position = Vector2(x, y)
