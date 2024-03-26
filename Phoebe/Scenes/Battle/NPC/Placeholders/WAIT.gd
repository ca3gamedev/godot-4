extends Node

@export var id : int
@export var near : bool

func Update(delta):
	if near and Input.is_action_just_released("SPACE"):
		var pos = $"../../../".GetEmptyBed()
		if pos != Vector3.ZERO:
			$"../../".global_position = pos
			%Anim.play("RestBed")
			%Dialogs.hide()
			%DialogArea.wait = false
			%FSM.current = %FSM.get_node("SLEEP")

func Physics(delta):
	pass
