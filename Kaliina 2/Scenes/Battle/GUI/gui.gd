extends Node2D

func _ready() -> void:
	DataPath.GUI = self
	$CanvasLayer/HPBar.max_value = CombatData.MaxHP
	UpdateHP()

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

func UpdateHP():
	$CanvasLayer/HP.text = str(CombatData.HP)
	$CanvasLayer/HPBar.value = CombatData.HP
