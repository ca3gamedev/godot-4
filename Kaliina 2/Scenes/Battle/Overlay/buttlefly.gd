extends CharacterBody2D

@export var dir : Vector2
@export var speed : float

func _ready() -> void:
	var newscale = randf_range(0.5, 1.5)
	$AnimatedSprite2D.scale = Vector2(newscale, newscale)


func _physics_process(delta: float) -> void:
	
	move_and_collide(dir * delta * speed)
	

func _on_timer_timeout() -> void:
	var x = randf_range(-1, 1)
	var y = randf_range(-1, 1)
	
	if randi_range(0, 5) < 3:
		dir = Vector2.ZERO
	else:
		dir = Vector2(x, y)
	
	if dir.x < 0:
		$AnimatedSprite2D.scale.x = -1
	else:
		$AnimatedSprite2D.scale.x = 1
