extends CharacterBody2D

@export var angle : Vector2
@export var speed : float

func _ready():
	angle = (Variables.Player.global_position - self.global_position).normalized()

func _physics_process(delta):
	var dir = angle * delta * speed
	var colision = self.move_and_collide(dir)
	
	if colision != null:
		if colision.get_collider().is_in_group("WALL"):
			self.queue_free()
