extends CharacterBody2D

@export var dir : Vector2
@export var speed : float

func _physics_process(delta: float) -> void:
	
	var colision = move_and_collide(dir * delta * speed)
	
	if colision:
		if colision.get_collider().is_in_group("Wall"):
			self.queue_free()
		if colision.get_collider().is_in_group("Pacifica"):
			self.queue_free()
