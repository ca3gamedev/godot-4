extends Node

@onready var current = $"IDLE"
@export var walk_speed : float

func _process(delta):
	current.Transition(delta)
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)
