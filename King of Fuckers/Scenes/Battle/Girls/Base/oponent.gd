extends CharacterBody2D

@export var walk_speed : float
var angle = Vector2.ZERO
var offset_pos = Vector2.ZERO
var dist = 0

@export var bullet : PackedScene

func _ready():
	dist = randf_range(50, 200)
	offset_pos.x = randf_range(-100, 100)
	offset_pos.y = randf_range(-100, 100)
	
	$Bullet.start(randf_range(0.5, 5))

func _process(delta):
	
	angle = ((Variables.Player.global_position + offset_pos) - self.global_position).normalized()

func _physics_process(delta):
	
	var dir = angle * delta * walk_speed
	if Variables.Player.global_position.distance_to(self.global_position) > dist:
		self.move_and_collide(dir)


func _on_bullet_timeout():
	var tmp = bullet.instantiate()
	tmp.global_position = self.global_position
	Variables.Bullets.add_child(tmp)
	$Bullet.start(randf_range(0.5, 5))
