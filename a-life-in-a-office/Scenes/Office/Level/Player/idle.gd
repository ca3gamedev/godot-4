extends Node

func Transition():
	
	var idle = true
	
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		idle = false
	
	if not idle:
		$"../".current = $"../WALK"
	
func Update(delta):
	pass
	
func Physics(delta):
	pass
