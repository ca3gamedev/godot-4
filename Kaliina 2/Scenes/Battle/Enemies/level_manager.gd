extends Node2D

@export var speed : float

func _process(delta: float) -> void:
	
	
	var enemies = get_tree().get_nodes_in_group("Enemy").size()
	if enemies < 1 :
		$Level01.global_position.y += delta * speed




func _on_monster_area_entered(area: Area2D) -> void:
	if area.is_in_group("Spawn"):
		area.SpawnEnemy()
