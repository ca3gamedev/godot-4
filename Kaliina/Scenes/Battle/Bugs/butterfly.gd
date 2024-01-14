extends CharacterBody2D

@export var dir : Vector2
@export var speed : float

func _ready():
	$Timer.start(1)
	speed = randf_range(10, 50)
	$Sprite/AnimatedSprite2D.scale = randf_range(1, 3) * Vector2(1,1)

func StopDir():
	dir = Vector2.ZERO

func ChangeDir():
	dir.x =  randf_range(-1, 1)
	dir.y = randf_range(-1, 1)

func MyTimer():
	speed = randf_range(10, 50)
	var chance = randf_range(1, 10)
	if chance > 7:
		StopDir()
	else:
		ChangeDir()
	
	if dir.x < 0:
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1


func _on_timer_timeout():
	MyTimer()
	$Timer.start(randf_range(1,5))
	
func _physics_process(delta):
	
	move_and_collide(delta * dir * speed)
