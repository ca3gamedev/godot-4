extends Node2D

@export var RosaArea : PackedScene
@export var DataPath : Node2D
@export var GoldChest : PackedScene

func _ready():
	Spawn()

func KillArea():
	$Timer.start(5)

func Spawn():
	var tmp = RosaArea.instantiate()
	add_child(tmp)
	var x = randf_range($TopLeft.global_position.x, $BottomRight.global_position.x)
	var y = randf_range($TopLeft.global_position.y, $BottomRight.global_position.y)
	tmp.global_position = Vector2(x, y)
	var id = randf_range(-10, 10)
	tmp.SETID(id)


func _on_timer_timeout():
	Spawn()

func Gold():
	var tmp = GoldChest.instantiate()
	%Items.add_child(tmp)
	var x = randf_range($TopLeft.global_position.x, $BottomRight.global_position.x)
	var y = randf_range($TopLeft.global_position.y, $BottomRight.global_position.y)
	tmp.global_position = Vector2(x, y)
	
