extends Node

@onready var current = $IDLE
@onready var state_machine = %Anims["parameters/playback"]

func _ready():
	%Anims.active = true

func _process(delta):
	current.Transition()
	current.Update()
	
	Variables.get_node("DataPaths").GUI.get_node("CanvasLayer/arrowbuffer").text = "blend position : " + str(%Anims.get("parameters/MOVE/blend_position"))

func _physics_process(delta):
	current.Physics(delta)
