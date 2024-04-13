extends Node

@export var speed : float

func Update(delta):
	pass

func Physics(delta):
	
	var angle = DataPath.Pacifica.global_position - $"../../".global_position
	angle = angle.normalized()
	
	if DataPath.Pacifica.global_position.distance_to($"../../".global_position) > 200:
		$"../../".move_and_collide(angle * speed * delta)
