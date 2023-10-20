extends CharacterBody3D

@onready var angle = Vector3.ZERO
@export var speed : float
@export var damage : float

	
func _physics_process(delta):
	angle = Variables.get_node("DataPaths").HPCore.global_position - self.global_position
	angle = angle.normalized()
	
	var colision = self.move_and_collide(delta * angle * speed)
	
	if colision:
		Variables.get_node("Code/HPHit").HIT(damage)
		self.queue_free()


func _on_dead_timeout():
	self.queue_free()
