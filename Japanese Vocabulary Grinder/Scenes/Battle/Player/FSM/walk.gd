extends Node

@onready var Root = $"../../"

func Transition():
	if %INPUT.CheckKeysDir() == Vector2i.ZERO:
		%FSM.current = %FSM.get_node("IDLE")

func Update(delta):
	if %INPUT.CheckKeysDir() != Vector2i.ZERO:
		%DATA.dir = %INPUT.CheckKeysDir()
		if Root.near:
			Variables.Stamina -= delta * 10
			Variables.Words.UpdateStamina()

func Physics(delta):
	var speed = %DATA.walk_speed * delta * %DATA.dir
	Root.move_and_collide(speed)
