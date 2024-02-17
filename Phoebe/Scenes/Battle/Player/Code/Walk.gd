extends Node

@export var walk_speed : float



func Update(delta):
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGTH") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		pass
	else:
		%states.set_param("Walk", false)
	
	var dir = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT"):
		dir.x = -1
	if Input.is_action_pressed("RIGTH"):
		dir.x = 1
	if Input.is_action_pressed("DOWN"):
		dir.y = 1
	if Input.is_action_pressed("UP"):
		dir.y = -1
	
	if dir != Vector2i.ZERO:
		%FSM.dir = dir
	
	var speed = walk_speed * %FSM.dir * delta
	$"../../".velocity = Vector3(speed.x, 0, speed.y)
	$"../../".move_and_slide()
	
	var angle = %Actions.get("parameters/MOVE/blend_position")
	angle = angle.slerp(Vector2(0.5, 0), 0.02)
	%Actions.set("parameters/MOVE/blend_position", angle)

