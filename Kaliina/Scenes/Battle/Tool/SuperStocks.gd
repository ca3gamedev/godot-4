extends Node

@export var mana : float

func AddStock(score):
	mana += score
	MyGUI.get_node("SuperStock").value = mana
	
	if mana >= 100:
		mana = 100
