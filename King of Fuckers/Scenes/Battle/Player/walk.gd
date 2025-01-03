extends Node

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		pass
	else:
		%Ani.set("parameters/MOVE/blend_position", $"../".dir * 0.5)
		$"../".current = $"../".get_node("IDLE")

func Update(delta):
	
	var dir = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT"):
		dir.x = -1
	if Input.is_action_pressed("RIGHT"):
		dir.x = 1
	if Input.is_action_pressed("DOWN"):
		dir.y = -1
	if Input.is_action_pressed("UP"):
		dir.y = 1
	
	if dir != Vector2i.ZERO:
		$"../".dir = dir
		%Ani.set("parameters/MOVE/blend_position", dir)

func Physics(delta):
	
	var speed = $"../".dir * delta * $"../".walk_speed * 100
	speed.y *= -1
	$"../../".velocity = speed
	
	$"../../".move_and_slide()
