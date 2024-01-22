extends Node

@export var levels : int
@export var GameOver : String
@export var timeleft : float

func _ready():
	MyGUI.get_node("Timer").text = str(int(timeleft))


func _process(delta):
	
	if not CombatData.Protected:
		timeleft -= delta * levels
		MyGUI.get_node("Timer").text = str(int(timeleft))
	else:
		var time = (CombatData.score / 500) * delta
		timeleft -= time
		MyGUI.get_node("Timer").text = str(int(timeleft))

