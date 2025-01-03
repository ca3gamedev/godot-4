extends Node2D

@export var id : int
@export var type : int

func SetTileID(new_id):
	$Tile.frame = new_id
	type = new_id

func GetType():
	return type
