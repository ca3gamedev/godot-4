extends Node2D

@export var panties : PackedScene

func ATTACKBOSS():
	
	for i in 10:
		
		var x = 0
		var choice = randi_range(0, 10)
		choice = randi_range(0, 10)
		if choice > 5 :
			x = $SpawnLeftTop.global_position.x
		else:
			x = $SpawnRightTop.global_position.x
		var y = randf_range($SpawnLeftTop.global_position.y, $SpawnLeftBottom.global_position.y)
		
		var tmp = panties.instantiate()
		tmp.global_position = Vector2(x, y)
		$Bullets.add_child(tmp)
