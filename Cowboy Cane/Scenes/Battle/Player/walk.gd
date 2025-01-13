extends Node

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		pass
	else:
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	
	if Input.is_action_just_released("SLASH"):
		%FSM.current = %FSM.get_node("ATTACK1")
		%FSM.current.Start()

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
		%FSM.dir = dir
	
	var angle = %Anim.get("parameters/MOVE/blend_position")
	angle = lerp(Vector2(angle.x, angle.y), Vector2(0.5, 0.0), delta * 10)
	%Anim.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	
	var speed = %FSM.dir * delta * %FSM.walk_speed * Vector2(1, -1)
	$"../..".move_and_collide(Vector3(speed.x, 0, speed.y))
