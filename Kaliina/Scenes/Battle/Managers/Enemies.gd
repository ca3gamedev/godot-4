extends Node2D

@export var DataPaths : Node2D
@export var max_enemies : int
@export var Enemy01 : PackedScene
@export var Coin01 : PackedScene

func Spawn():
	if get_tree().get_nodes_in_group("ENEMY").size() < max_enemies:
		var tmp = Enemy01.instantiate()
		var x = randf_range($LEFT.global_position.x, $RIGHT.global_position.x)
		tmp.global_position = Vector2(x, $LEFT.global_position.y)
		add_child(tmp)


func _on_spawn_check_timeout():
	Spawn()

func Coin(pos):
	var tmp = Coin01.instantiate()
	%Items.call_deferred("add_child", tmp)
	tmp.global_position = pos

func UpdateCoin():
	%GUI.get_node("ScoreLabel").text = str(CombatData.score)

func HIT(id):
	match(id):
		"hit" : %SuperStocks.AddStock(5)
		"super" : %SuperStocks.AddStock(20)
