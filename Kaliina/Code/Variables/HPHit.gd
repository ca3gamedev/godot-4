extends Node

@export var HP : int
@export var PostBattle : String

func HIT(damage):
	HP -= damage
	%DataPaths.myGUI.UpdateHP()
	if HP < 1 :
		ToDie()

func ToDie():
	get_tree().change_scene_to_file(PostBattle)
