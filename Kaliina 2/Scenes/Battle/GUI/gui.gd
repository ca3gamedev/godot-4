extends Node2D

func _ready() -> void:
	DataPath.GUI = self

func AddBall(delta):
	$CanvasLayer/Strenght.value += delta

func ClearBall():
	$CanvasLayer/Strenght.value = 0

func GetBall():
	return $CanvasLayer/Strenght.value

func GetCenter():
	return $CanvasLayer/Center.global_position

func GetID():
	return $CanvasLayer/Cards.GetID()
