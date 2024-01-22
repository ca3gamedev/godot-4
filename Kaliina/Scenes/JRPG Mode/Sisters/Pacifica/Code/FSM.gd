extends Node


@onready var current = $IDLE
@onready var dir = Vector2i.DOWN

func _process(delta):
	current.Transition()
	current.Update(delta)
	
func _physics_process(delta):
	current.Physics(delta)
