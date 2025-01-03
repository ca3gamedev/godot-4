extends Node

func Transition():
	
	var idle = true
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN"):
		idle = false
	
	if idle:
		$"../".current = $"../".get_node("IDLE")
		%Anim.set("parameters/MOVE/blend_position", 0)
	
	if Input.is_action_pressed("PUNCH"):
		$"../".current = $"../".get_node("PUNCH")
		$"../".current.Start()
	

func Update(delta):
	var dir = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT"):
		dir.x = -1
		%Parent.scale = Vector2(-0.3, 0.3)
	if Input.is_action_pressed("RIGHT"):
		dir.x = 1
		%Parent.scale = Vector2(0.3, 0.3)
	if Input.is_action_pressed("UP"):
		dir.y = -1
	if Input.is_action_pressed("DOWN"):
		dir.y = 1
	
	%Anim.set("parameters/MOVE/blend_position", 1)
	
	if dir != Vector2i.ZERO:
		$"../".dir = dir
	
func Physics(delta):
	
	var speed = ($"../".dir * delta).normalized() * $"../".walk_speed
	$"../..".move_and_collide(speed)
