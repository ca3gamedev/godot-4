extends Node2D

@export var level : PackedScene
@export var levelend : PackedScene
@export var xoffset : int

func _ready():
	
	%Camera2D.global_position = $Tile.global_position
	%target.global_position = %Player.global_position
	
	for i in 10 :
		var tmp = level.instantiate()
		tmp.global_position.x = xoffset * (i + 1)
		add_child(tmp)
	
	var tmp = levelend.instantiate()
	tmp.global_position.x = xoffset * 11
	add_child(tmp)

func _process(delta):
	
	%Camera2D.global_position = %Camera2D.global_position.slerp(%target.global_position, delta * 3)
	
	if %target.global_position.distance_to(%Player.global_position) > 100:
		%target.global_position = %target.global_position.slerp(%Player.global_position, delta * 10)
