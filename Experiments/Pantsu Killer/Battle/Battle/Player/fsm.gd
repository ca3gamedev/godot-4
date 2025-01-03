extends Node

@onready var current = $IDLE
@export var dir : Vector2i
@export var walk_speed : float

func _ready():
	%Anim.active = true
	%Parent.scale = Vector2(0.3, 0.3)

func _process(delta):
	current.Transition()
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)
