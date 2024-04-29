extends Node


@export var walk_speed : float

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN"):
		pass
	else:
		%FSM.current = %FSM.get_node("IDLE")

func Update(_delta):
	
	var dir = Vector2i.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		dir.x = -1
	if not Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		dir.x = 1
	if Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		dir.y = -1
	if not Input.is_action_pressed("UP") and Input.is_action_pressed("DOWN"):
		dir.y = 1
	
	if dir != Vector2i.ZERO:
		%FSM.dir = dir
	

func Physics(delta):
	
	%FSM.get_parent()
	DataPath.DungeonGUI.Walk(delta)
	
	var speed = delta * %FSM.dir * walk_speed * 100
	%FSM.get_parent().velocity = speed
	if is_instance_valid(%FSM.get_parent()):
		%FSM.get_parent().move_and_slide()
