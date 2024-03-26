extends Node

@export var speed : float
@export var accel : float

@export var NavAge : NavigationAgent3D

func Update(delta):
	
	var dist = $"../../".global_position.distance_to($"../../../".Cubicle.global_position)
	if dist < 3:
		%DialogArea.wait = true
		%FSM.current = %FSM.get_node("WAIT")
	

func Physics(delta):
	
	var dir = Vector3()
	
	NavAge.target_position = $"../../../".Cubicle.global_position
	
	dir = NavAge.get_next_path_position() - $"../..".global_position
	dir = dir.normalized()
	
	$"../../".velocity = $"../../".velocity.lerp(dir * speed, accel * delta)
	
	$"../../".move_and_slide()
