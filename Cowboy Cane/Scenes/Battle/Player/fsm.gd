extends Node

@export var walk_speed : float
@export var walk_multi : float
@onready var current = $IDLE
@export var dir : Vector2i

func _ready():
	%Anim.active = true

func _process(delta):
	current.Transition()
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)
