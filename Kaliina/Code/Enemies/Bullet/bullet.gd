extends CharacterBody3D

@onready var angle = Vector3.ZERO
@export var speed : float
@export var damage : float
var target
@export var treebullet : bool


func _ready():
	if not treebullet:
		target = Variables.get_node("DataPaths").HPCore

func _physics_process(delta):
	
	if target == null:
		self.queue_free()
	else:
		angle = target.global_position - self.global_position
		angle = angle.normalized()
		
		var colision = self.move_and_collide(delta * angle * speed)
		
		if colision:
			
			if colision.get_collider().is_in_group("Tree"):
				colision.get_collider().HIT(damage)
			
			if colision.get_collider().is_in_group("HPCore"):
				Variables.get_node("Code/HPHit").HIT(damage)
			self.queue_free()


func _on_dead_timeout():
	self.queue_free()
