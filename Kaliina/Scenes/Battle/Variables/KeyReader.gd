extends Node

func _process(delta):
	var dir = GetArrows()
	%InputBuffer.AddInputArrow(dir)
	%InputBuffer.AddButton(GetButtons())
	

func GetArrows():
	var dir = Vector3i.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		dir.x = -1
	if not Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		dir.x = 1
	if Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		dir.y = -1
	if not Input.is_action_pressed("UP") and Input.is_action_pressed("DOWN"):
		dir.y = 1
	
	return dir

func GetButtons():
	var button = "none"
	
	if Input.is_action_just_released("KICK"):
		button = "KICK"
	
	return button
