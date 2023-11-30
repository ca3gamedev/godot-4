extends Node

@export var speed : float
@onready var target = null
@export var targetoff : Vector2

func _ready():
	targetoff.x = randf_range(-8000, 8000)
	targetoff.y = randf_range(-8000, 8000)

func Update():
	pass
	
func Physics(delta):
	
	if target == null:
		target = %FSM.Root.get_parent().DataPaths.Rosa
	
	if not %FSM.Root.Attack:
		var angle = (target.global_position - %FSM.Root.global_position).normalized()
		%FSM.Root.move_and_collide(angle * speed * delta)
	
	if %FSM.Root.myoff:
		var angle = (targetoff - %FSM.Root.global_position).normalized()
		%FSM.Root.move_and_collide(angle * delta * speed * 5)
