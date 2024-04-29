extends Node2D

func _ready() -> void:
	DataPath.BattleRoot = self
	MakeCamera()

func MakeCamera():
	$Camera2D.make_current()
