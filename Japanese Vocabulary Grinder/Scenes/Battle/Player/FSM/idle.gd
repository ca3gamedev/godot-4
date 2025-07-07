extends Node

@onready var Root = $"../../"

func Transition():
	if %INPUT.CheckKeysDir() != Vector2i.ZERO:
		%FSM.current = %FSM.get_node("WALK")

func Update(delta):
	if Root.near:
		Variables.Stamina -= delta * 4
		Variables.Words.UpdateStamina()

func Physics(delta):
	pass
