extends Node

@export var mypause : bool

func _ready():
	%PAUSE.hide()

func _process(delta):
	
	if Input.is_action_just_released("PAUSE") and CombatData.IsGame:
		mypause = !mypause
		if mypause:
			get_tree().paused = true
			%PAUSE.show()
		else:
			get_tree().paused = false
			%PAUSE.hide()
	
	
