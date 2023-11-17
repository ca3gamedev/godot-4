extends Button

@export var Next : String
@export var id : int
@export var end_battle : bool
@export var reset_id : bool


func _on_pressed():
	
	if reset_id:
		CurrentLevel.ResetBattles()
	
	if end_battle:
		CurrentLevel.EndBattle(id)
	
	get_tree().change_scene_to_file(Next)
