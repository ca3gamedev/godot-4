extends RigidBody3D

@export var damage : int

func _on_area_3d_body_entered(body):
	
	if body.is_in_group("Enemy"):
		body.get_parent().HIT(damage)
		self.queue_free()
