extends Node

@export var kickforce : float

func _on_melee_body_entered(body):
	if body.is_in_group("Enemy"):
		body.apply_impulse(Vector3(0.2,1.0, -0.5) * kickforce)
