extends CharacterBody3D

@export var test : bool

@export var walk : bool
@export var hit : bool

@export var Bullet : PackedScene
@onready var Pacifica = Variables.get_node("DataPaths").Pacifica
@onready var HPCore = Variables.get_node("DataPaths").HPCore

@export var sleepy : bool

var speed = 5
var accel = 10


func HIT():
	hit = true
	$HIT.start(5)


func _on_hit_timeout():
	hit = false


func _on_bullet_timeout():
	
	var tmp = Bullet.instantiate()
	Variables.get_node("DataPaths").EnemyBullets.add_child(tmp)
	tmp.global_position = self.global_position

func _physics_process(delta):
	
	if Variables.get_node("DataPaths").startfinished and not sleepy:
		var dir = Vector3.ZERO
		
		%nav.target_position = HPCore.global_position
		
		dir = %nav.get_next_path_position() - self.global_position
		dir = dir.normalized()
		
		self.velocity = velocity.lerp(dir * speed, accel * delta)
		
		move_and_slide()


func _on_sleepy_timeout():
	sleepy = !sleepy
