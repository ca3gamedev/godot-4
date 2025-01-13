extends Node2D

@export var TOPLEFT : Marker2D
@export var BOTTOMRIGHT : Marker2D

func _ready():
	Variables.TOPLEFT = TOPLEFT
	Variables.BOTTOMRIGHT = BOTTOMRIGHT
	
	Music.Play("Test")
