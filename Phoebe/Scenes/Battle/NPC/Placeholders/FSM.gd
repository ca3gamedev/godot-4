extends Node


@onready var current = $START

func _process(delta):
	
	current.Update(delta)
	
func _physics_process(delta):
	
	current.Physics(delta)
