extends Node

@onready var current = $IDLE
@export var id : int
@export var Root : CharacterBody2D

func _ready():
	%Anim.active = true

func _process(delta):
	
	current.Transition()
	current.Update()

func _physics_process(delta):
	
	current.Physics(delta)
