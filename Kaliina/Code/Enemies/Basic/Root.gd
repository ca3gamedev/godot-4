extends RigidBody3D

@export var test : bool

@export var walk : bool
@export var hit : bool

@export var Bullet : PackedScene

func _ready():
	if test:
		$Bullet.start(randf_range(4, 10))

func _integrate_forces(state):
	
	if not hit:
		self.linear_velocity = $FSM.vel

func HIT():
	hit = true
	$HIT.start(5)


func _on_hit_timeout():
	hit = false


func _on_bullet_timeout():
	
	if not test:
		var tmp = Bullet.instantiate()
		Variables.get_node("DataPaths").EnemyBullets.add_child(tmp)
		tmp.global_position = self.global_position
