extends Node


func Update(delta):
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGTH") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		%states.set_param("Walk", true)
	
	var angle = %Actions.get("parameters/MOVE/blend_position")
	angle = angle.slerp(Vector2.ZERO, 0.08)
	%Actions.set("parameters/MOVE/blend_position", angle)
