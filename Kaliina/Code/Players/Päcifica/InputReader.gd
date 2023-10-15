extends Node

func _process(delta):
	var arrow = ArrowsRead()
	if arrow != Vector2i.ZERO:
		%Array.AddArrow(arrow)
	
	var button = ButtonReads()
	if button != "none":
		%Array.AddButton(button)
	
func ButtonReads():
	var button = "none"
	if Input.is_action_just_released("A"):
		button = "A r"
	return button

func ArrowsRead():
	var dir = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		dir.x = -1
	if not Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		dir.x = 1
	if Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		dir.y = -1
	if Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		dir.y = 1
		
	if Input.is_action_just_released("LEFT"):
		dir.x = -2
	if Input.is_action_just_released("RIGHT"):
		dir.x = 2
	if Input.is_action_just_released("UP"):
		dir.y = -2
	if Input.is_action_just_released("DOWN"):
		dir.y = 2
	
	return dir
