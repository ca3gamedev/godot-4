extends Area2D

@export var id : int
@export var Enemy01 : PackedScene

func SpawnEnemy():
	var tmp
	match(id):
		0 : tmp = Enemy01.instantiate()
	
	$"../".call_deferred("add_child", tmp)
	tmp.global_position = self.global_position
	self.queue_free()
