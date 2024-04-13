extends RigidBody2D

@export var strenght : float
@export var id : int
@export var damage : float
@export var HP : int

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Wall"):
		var angle = DataPath.GUI.GetCenter() - self.global_position
		angle = angle.normalized()
		self.apply_impulse(angle * strenght / 3, Vector2.ZERO) 
		HP += 1
	
	if body.is_in_group("Enemy"):
		body.HIT(id, damage, self.global_position)
		HP -= 1
		
		if HP < 1 :
			self.queue_free()
		else:
			var angle = DataPath.Pacifica.global_position - self.global_position
			angle = angle.normalized()
			self.apply_impulse(angle * strenght / 3, Vector2.ZERO) 

	
	if body.is_in_group("Bottom"):
		self.queue_free()

func SetID(newid):
	id = newid
	$Sprite.frame = id
