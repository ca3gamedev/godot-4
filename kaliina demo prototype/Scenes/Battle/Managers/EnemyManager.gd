extends Node2D

@export var Enemy01 : PackedScene
@export var Enemy01_R : PackedScene


func _ready():
	Spawn()

func Spawn():
	var tmp = Enemy01.instantiate()
	self.add_child(tmp)
	tmp.global_position = $Spawn01.global_position
	
	var tmp_r = Enemy01_R.instantiate()
	self.add_child(tmp_r)
	tmp_r.global_position = $HidePosition.global_position
	
	tmp.Start(tmp_r)
	tmp_r.EnemyID = tmp
	
