extends Camera2D

@export var speed : float

func _physics_process(delta):
	
	get_parent().progress_ratio += delta * speed
