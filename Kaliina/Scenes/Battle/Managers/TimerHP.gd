extends Node

@export var levels : int
@export var GameOver : String
@export var timeleft : float

func _ready():
	%GUI.get_node("TimerHP").max_value = timeleft
	%GUI.get_node("TimerHP").value = timeleft


func _process(delta):
	
	if not CombatData.Protected:
		timeleft -= delta * levels
		%GUI.get_node("TimerHP").value = timeleft
	else:
		var time = (CombatData.score / 500) * delta
		timeleft -= time
		%GUI.get_node("TimerHP").value = timeleft
	
	if %GUI.get_node("TimerHP").value <= 0 :
		get_tree().change_scene_to_file(GameOver)
