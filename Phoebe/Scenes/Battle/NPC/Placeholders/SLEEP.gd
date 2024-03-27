extends Node

@onready var near = false
@export var Medicine : PackedScene

func Update(delta):
	if near and Input.is_action_just_released("SPACE"):
		%Dialogs.hide()
		var tmp = Medicine.instantiate()
		$"../../".add_child(tmp)
		tmp.MaxProgress(CombatData.Level + 1)
		get_tree().paused = true

func Physics(delta):
	pass
