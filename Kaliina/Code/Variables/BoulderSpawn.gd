extends Node


func _process(delta):
	
	var button = CheckInput()
	
	if button == "B r":
		SpawnBoulder()


func CheckInput():
	var button = "none"
	
	if Input.is_action_just_released("B"):
		button = "B r"
	return button

func SpawnBoulder():
	Variables.get_node("DataPaths").OnagerManager.SpawnBoulder(0)
