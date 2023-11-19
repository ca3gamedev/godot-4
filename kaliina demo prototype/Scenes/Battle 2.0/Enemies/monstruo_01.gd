extends Node2D

@export var id : int
@export var HP : int

func _ready():
	$Timer.start(1)
	$ProgressBar.max_value = HP
	$ProgressBar.value = HP


func _on_timer_timeout():
	$Timer.start(randf_range(0.2, 2))
	Move()
	
func Move():
	var newid = randf_range(-10, 10)
	
	if newid < 0:
		if id > 1:
			id -= 1
	else:
		if id < 3:
			id += 1


func KICK():
	HP -= 1
	$ProgressBar.value = HP
	
	if HP < 1:
		get_parent().EnemyKilled()
