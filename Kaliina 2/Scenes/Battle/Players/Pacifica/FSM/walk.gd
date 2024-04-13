extends Node

@export var walk_speed : float
@export var dir : Vector2i

func Transition():
	
	if not Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		%FSM.current = %FSM.get_node("IDLE")
	
	if Input.is_action_just_released("CHANGE"):
		$"../../".Pacifica = !$"../../".Pacifica
		$"../../".ChangeSprite()
	
func Update(delta):
	dir = Vector2.ZERO
	if Input.is_action_pressed("LEFT"):
		dir.x = -1
	if Input.is_action_pressed("RIGHT"):
		dir.x = 1
	if Input.is_action_pressed("UP"):
		dir.y = -1
	if Input.is_action_pressed("DOWN"):
		dir.y = 1
	
func Physics(delta):
	var speed = delta * walk_speed * dir
	$"../../".move_and_collide(speed)
