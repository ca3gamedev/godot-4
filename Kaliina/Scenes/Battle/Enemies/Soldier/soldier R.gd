extends CharacterBody2D

@export var HITtest : Vector2
@export var EnemyID : CharacterBody2D

@onready var pos = Vector2.ZERO
@onready var hit = false
@onready var hit2 = false
var speed = Vector2.ZERO
@export var gravity : float

func HIT(newpos):
	speed = HITtest
	self.global_position = newpos

func _physics_process(delta):
	speed.y += delta * gravity
	
	var colision = move_and_collide(speed * delta)
	
	if colision:
		EnemyID.global_position = self.global_position
		self.global_position.y = 9999
