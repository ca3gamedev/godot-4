extends Node3D

@export var coin : PackedScene

func _ready():
	Variables.CoinManager = self

func SpawnCoin(pos):
	var tmp = coin.instantiate()
	
	tmp.global_position = pos
	add_child(tmp)
