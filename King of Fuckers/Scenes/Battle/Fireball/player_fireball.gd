extends CharacterBody2D

@export var angle : Vector2
@export var speed : float

func _physics_process(delta):
	var dir = angle * speed * delta
	self.move_and_collide(dir)


func _on_area_2d_body_entered(body):
	Variables.GUI.HIT(body.name)
	self.queue_free()
