extends Camera2D

func _process(delta):
	
	if self.global_position.distance_to(Variables.Player.global_position) > 10:
		self.global_position = self.global_position.slerp(Variables.Player.global_position, delta * 2)
