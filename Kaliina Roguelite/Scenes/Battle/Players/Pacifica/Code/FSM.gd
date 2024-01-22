extends Node

@onready var current = $IDLE

func _process(delta):
	current.Transition()
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)
