extends Camera2D


func _process(delta):
	
	%Camera2D.global_position = %Camera2D.global_position.slerp(%target.global_position, delta * 3)
	
	if %target.global_position.distance_to(%Player.global_position) > 100:
		%target.global_position = %target.global_position.slerp(%Player.global_position, delta * 10)
