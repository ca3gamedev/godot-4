extends Node

@onready var id : int

func EndBattle(new_id):
	if new_id == id:
		id += 1

func ResetBattles():
	id = 1
