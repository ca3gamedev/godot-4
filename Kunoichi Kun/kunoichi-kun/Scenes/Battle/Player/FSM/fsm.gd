extends Node


@onready var current = $IDLE

func _ready() -> void:
	%POS.active = true
	%Rots.active = true
	%Anims.active = true

func _process(delta: float) -> void:
	current.Transition()
	current.Update(delta)
	
func _physics_process(delta: float) -> void:
	current.Physics(delta)
