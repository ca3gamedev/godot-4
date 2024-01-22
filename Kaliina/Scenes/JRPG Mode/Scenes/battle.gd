extends Node2D

func SpawnTest():
	SpawnBattle(CombatData.get_node("Levels").GetLevel("11"))

func SpawnBattle(battle):
	var tmp2 = load(battle)
	var tmp = tmp2.instantiate()
	call_deferred("add_child", tmp)

func RemoveBattle():
	get_node("Battle").queue_free()
