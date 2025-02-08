extends Node

@export var current : Node
@export var walk_speed : float

func _process(delta):
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)
