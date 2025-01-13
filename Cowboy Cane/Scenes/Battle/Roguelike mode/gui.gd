extends Node2D

func _ready():
	Variables.GUI = self
	
	$CanvasLayer/Level.text = "LEVEL : " + str(Variables.roguelevelsid)

func _process(delta):
	
	$CanvasLayer/FPS.text = "FPS : " + str(Engine.get_frames_per_second())

func HIT():
	pass
