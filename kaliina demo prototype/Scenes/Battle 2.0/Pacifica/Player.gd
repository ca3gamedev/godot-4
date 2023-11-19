extends Node2D

@export var pacifica_id : int

func _process(delta):
	
	if %DASHBAR.value > %DASHBAR.max_value - 0.1:
		if pacifica_id > 1  and Input.is_action_just_released("LEFT"):
			pacifica_id -= 1
			%DASHBAR.value = 0
		if pacifica_id < 3 and Input.is_action_just_released("RIGHT"):
			pacifica_id += 1
			%DASHBAR.value = 0
	else:
		%DASHBAR.value += delta * 3
		
	var target = GetTarget()
	$Pacifica.global_position = target
	
	
	if %ATTACK.value > %ATTACK.max_value - 0.1:
		if Input.is_action_just_released("KICK"):
			%ATTACK.value = 0
			%Monster.KICK(pacifica_id)
	else:
		%ATTACK.value += delta * 1.5
	

func GetTarget():
	var pos = $Pos1.global_position
	
	match(pacifica_id):
		1 : pos = $Pos1.global_position
		2 : pos = $Pos2.global_position
		3 : pos = $Pos3.global_position
	
	return pos
