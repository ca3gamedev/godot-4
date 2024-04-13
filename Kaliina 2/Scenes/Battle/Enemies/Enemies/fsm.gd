extends Node

@export var current : Node

func _process(delta: float) -> void:
	
	if current != null:
		current.Update(delta)
	
func _physics_process(delta: float) -> void:
	
	if current != null:
		current.Physics(delta)
