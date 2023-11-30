extends Node

func _process(delta):
	var arrow = GetArrow()
	%Buffer.AddArrow(arrow)
	
	var button = GetButtons()
	if button != "none":
		%Buffer.AddButton(button)
	
func GetArrow():
	var arrow = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		arrow.x = -1
	if Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		arrow.x = 1
	if Input.is_action_pressed("UP")  and not Input.is_action_pressed("DOWN"):
		arrow.y = -1
	if Input.is_action_pressed("DOWN")  and not Input.is_action_pressed("UP"):
		arrow.y = 1
	
	return arrow

func GetButtons():
	var button = "none"
	
	if Input.is_action_pressed("UPGUN"):
		button = "A"
	if Input.is_action_pressed("DOWN"):
		button = "B"
	if Input.is_action_pressed("SHOOT"):
		button = "C"
	
	return button
