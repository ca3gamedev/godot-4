extends Node

@export var walk_speed : float
@onready var current = $IDLE
@export var dir : Vector2i
@export var rot_speed : float

func _process(delta):
	
	current.Transition()
	current.Update(delta)

func _physics_process(delta):
	
	current.Physics(delta)
