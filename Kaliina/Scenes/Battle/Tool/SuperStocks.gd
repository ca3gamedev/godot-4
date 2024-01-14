extends Node

@export var mana : float

func AddStock(score):
	mana += score
	MyGUI.get_node("SuperStock").value = mana
	
	if mana >= 100:
		mana = 100

func _process(delta):
	
	if Input.is_action_just_released("SUPER") and mana == 100:
		mana = 0
		MyGUI.get_node("SuperStock").value = mana
		
		for i in %Enemies.get_children():
			if i.is_in_group("ENEMY"):
				i.HIT(100, true, false)
