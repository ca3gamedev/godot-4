extends RigidBody2D

@export var myid : int
@export var hadouken : bool
@export var superball : bool
@export var damage : float

func _on_area_2d_body_entered(body):
	if body.is_in_group("GROUND"):
		self.queue_free()
	
	if body.is_in_group("ENEMY"):
		body.HIT(myid, damage, hadouken, superball)
		self.linear_velocity = Vector2.ZERO
		var angle = (get_parent().jump - self.global_position).normalized() * 800
		self.apply_impulse(angle)

func SetID(anim, id, mydamage):
	$Sprite.animation = anim
	myid = id
	damage = mydamage
