extends CharacterBody2D

@export var target : Marker2D
@export var walk_speed : float
@export var id : int

func _ready():
	ChangeTarget()
	$Attack.start(randf_range(2, 4))
	Variables.BOSS = self

func _physics_process(delta):
	var angle =  (target.global_position - self.global_position).normalized() * delta
	var speed = angle * walk_speed
	self.move_and_collide(speed)

func ChangeTarget():
	
	id = randi_range(0, 2)
	id = randi_range(0, 2)
	
	match(id):
		0 : 
			target = %Left
			%Sprites.scale = Vector2(-0.5, 0.5)
		1 : target = %Center
		2 : 
			target = %Right
			%Sprites.scale = Vector2(0.5, 0.5)


func _on_timer_timeout():
	ChangeTarget()


func _on_attack_timeout():
	$Anim.play("KICK")
	$Attack.start(randf_range(2, 4))
	$"../".ATTACKBOSS()


func _on_anim_animation_finished(anim_name):
	$Sprites.frame = 0

func HIT():
	Music.HIT()
	$Anim.play("HIT")
