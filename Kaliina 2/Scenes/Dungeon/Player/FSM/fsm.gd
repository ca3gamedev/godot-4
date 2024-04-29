extends Node

@onready var current = $IDLE

@export var dir : Vector2i


func _process(delta: float) -> void:
	current.Transition()
	current.Update(delta)

func _physics_process(delta: float) -> void:
	current.Physics(delta)
