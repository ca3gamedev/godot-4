extends Node

@export var right : int
@export var speed : float

func Update(_delta):
	pass

func Physics(delta):
	
	var vel = Vector2.ZERO
	vel.x = delta * speed * right
	
	var collision = $"../../".move_and_collide(vel)
	
	if collision:
		if collision.get_collider().is_in_group("Wall"):
			right *= -1
		if collision.get_collider().is_in_group("Enemy"):
			right *= -1
