extends Camera2D

@onready var target = %"0".global_position

func _process(delta):
	
	self.global_position = global_position.slerp(target, delta * 5)
