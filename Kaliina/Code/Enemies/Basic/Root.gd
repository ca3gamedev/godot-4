extends CharacterBody3D

@export var test : bool

@export var walk : bool
@export var hit : bool

@export var Bullet : PackedScene
@onready var HPCore = Variables.get_node("DataPaths").HPCore
@onready var TreeManager = Variables.get_node("DataPaths").TreeManager

@export var sleepy : bool

var target 

var speed = 5
var accel = 10

func _ready():
	GetNewTarget()


func GetNewTarget():
	var trees =  TreeManager.get_children()
	if trees.size() > 0:
		var id = randi_range(0, trees.size()-1)
		target = trees[id]
	else:
		target = HPCore
		


func HIT():
	hit = true
	$HIT.start(5)


func _on_hit_timeout():
	hit = false


func _on_bullet_timeout():
	
	var tmp = Bullet.instantiate()
	Variables.get_node("DataPaths").EnemyBullets.add_child(tmp)
	tmp.global_position = self.global_position
	tmp.treebullet = true

func _physics_process(delta):
	
	if target == null:
		GetNewTarget()
		$Sleepy.start(3)
		$Bullet.stop()
		$BulletTrees.stop()
	
	if Variables.get_node("DataPaths").startfinished and not sleepy:
		var dir = Vector3.ZERO
		
		%nav.target_position = target.global_position
		
		dir = %nav.get_next_path_position() - self.global_position
		dir = dir.normalized()
		
		self.velocity = velocity.lerp(dir * speed, accel * delta)
		
		move_and_slide()
		
		if self.global_position.distance_to(target.global_position) < 5 :
			%EnemyM.sleepy = true
			%Sleepy.stop()
			%BulletTrees.start(3)

func _on_sleepy_timeout():
	sleepy = !sleepy


func _on_bullet_trees_timeout():
	var tmp = Bullet.instantiate()
	Variables.get_node("DataPaths").EnemyBullets.add_child(tmp)
	tmp.global_position = self.global_position
	tmp.target = target
