extends Node

@onready var current = $WALK
@onready var Root = get_parent()

func _process(delta):
	
	Check()
	current.Update()

func _physics_process(delta):
	
	current.Physics(delta)

func Check():
	pass
