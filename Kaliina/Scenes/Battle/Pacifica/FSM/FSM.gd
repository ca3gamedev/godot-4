extends Node

@onready var current = $IDLE
@onready var state_machine = %Anims["parameters/playback"]

func _ready():
	%Anims.active = true

func _process(delta):
	current.Transition()
	current.Update()
	

func _physics_process(delta):
	current.Physics(delta)
