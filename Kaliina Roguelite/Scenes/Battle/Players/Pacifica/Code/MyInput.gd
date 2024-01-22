extends Node

func GetWalk():
	
	var dir = Vector2i.ZERO
	
	if Input.is_action_just_pressed("LEFT"):
		dir.x = -1
	if Input.is_action_just_pressed("RIGHT"):
		dir.x = 1
	if Input.is_action_just_pressed("DOWN"):
		dir.y = 1
	if Input.is_action_just_pressed("UP"):
		dir.y = -1
	
	return dir
