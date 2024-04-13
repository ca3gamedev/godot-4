extends Node2D

@export var Enemy01 : PackedScene

func _process(delta: float) -> void:
	
	if get_tree().get_nodes_in_group("Enemy").size() < 1:
		for i in 3:
			var x = randf_range($TopLeft.global_position.x, $BottomRight.global_position.x)
			var y = randf_range($TopLeft.global_position.y, $BottomRight.global_position.y) 
			var tmp = Enemy01.instantiate()
			add_child(tmp)
			tmp.global_position = Vector2(x, y)
