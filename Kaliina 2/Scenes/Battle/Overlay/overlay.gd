extends Node2D

@export var TopLeft : Marker2D
@export var BottomRight : Marker2D

@export var Buttlerfly : PackedScene

func _ready() -> void:
	$AnimatedSprite2D.frame = randi_range(0, 3)
	
	var bugs = randi_range(1, 5)
	
	for i in bugs:
		var tmp = Buttlerfly.instantiate()
		var x = randf_range(TopLeft.global_position.x, BottomRight.global_position.x)
		var y = randf_range(TopLeft.global_position.y, BottomRight.global_position.y)
		tmp.global_position = Vector2(x, y)
		$Butterflies.add_child(tmp)
