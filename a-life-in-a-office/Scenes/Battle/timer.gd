extends Node

func _process(delta):
	
	%Timer.value -= delta * Variables.dificulty
	
	if %Timer.value <= 0.5:
		Variables.ChangeScene("BATTLE END")
