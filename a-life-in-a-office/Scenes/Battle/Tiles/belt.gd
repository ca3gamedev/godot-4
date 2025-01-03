extends Node2D

@export var Tile : PackedScene
@export var offset : float
@export var size : int

var path = []

func _ready():
	
	for i in size:
		var tmp = Tile.instantiate()
		tmp.position = Vector2(i * offset, 0)
		tmp.id = i
		if randi_range(0, 10) > 6:
			tmp.SetTileID(randi_range(0, 2))
		else:
			tmp.SetTileID(3)
		path.append([])
		path[i] = tmp
		add_child(path[i])
	
	$"../Player".global_position = GetPos(0)

func GetPos(id):
	var i = id
	if id < 0:
		i = 0
	if id > size -1:
		i = size -1
	return path[i].global_position

func GetType(id):
	var i = id
	if id < 0:
		i = 0
	if id > size -1:
		i = size -1
	return path[i].GetType()

func Clear(id):
	path[id].SetTileID(3)
