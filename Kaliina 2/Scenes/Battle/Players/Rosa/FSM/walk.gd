extends Node

@export var Target : Vector2
@export var speed : float

func Transition():
	
	if Target.distance_to(DataPath.Rosa.global_position) < 50:
		%FSM.current = %FSM.get_node("IDLE")

func Update(delta):
	pass

func Physics(delta):
	var angle = Target - DataPath.Rosa.global_position
	angle = angle.normalized()
	$"../../".move_and_collide(angle * speed * delta)
