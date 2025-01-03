extends Node2D

@export var pantsu : PackedScene

func _ready():
	
	await  get_tree().process_frame
	
	for i in 50:
		var tmp = pantsu.instantiate()
		var pos = Vector2.ZERO
		pos.x = randf_range(Variables.TOPLEFT.global_position.x, Variables.BOTTOMRIGHT.global_position.x)
		pos.y = randf_range(Variables.TOPLEFT.global_position.y, Variables.BOTTOMRIGHT.global_position.y)
		tmp.global_position = pos
		add_child(tmp)
