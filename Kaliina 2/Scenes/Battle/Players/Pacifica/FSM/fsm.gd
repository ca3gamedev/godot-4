extends Node

@export var current : Node
@export var gravity : float

func _process(delta: float) -> void:
	
	current.Transition()
	current.Update(delta)
	
func _physics_process(delta: float) -> void:
	
	current.Physics(delta)
