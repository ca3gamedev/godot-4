extends Node2D

func _ready() -> void:
	DataPath.DungeonRoot = self
	Transition.FadeOut()

func HideCamera():
	$Camera2D.enabled = false

func CameraEnable():
	$Camera2D.global_position = $Flor.global_position
	$Camera2D.enabled = true
	$Camera2D.make_current()
