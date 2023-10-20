extends Node3D

@export var TestSpawn : bool
@export var Enemy01 : PackedScene

func _process(delta):
	if TestSpawn:
		SpawnTest()

func SpawnTest():
	if get_tree().get_nodes_in_group("Enemy").size() < 3:
		var tmp = Enemy01.instantiate()
		self.add_child(tmp)
		var pos = GetRandPos()
		tmp.global_position = Vector3(pos.x, $TopLeft.global_position.y, pos.y) 

func GetRandPos():
	var pos = Vector2.ZERO
	pos.x = randf_range($TopLeft.global_position.x, $BottomRight.global_position.x)
	pos.y = randf_range($TopLeft.global_position.z, $BottomRight.global_position.z)
	
	return pos
