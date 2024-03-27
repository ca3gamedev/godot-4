extends Node2D


func _ready():
	DataPaths.GUI = self
	$Timer/CanvasLayer/Progress.max_value = 9000
	$Timer/CanvasLayer/Progress.value = 9000
	UpdateTimer(0.1)
	$CanvasLayer/gold.text = str(CombatData.gold)


func UpdateTimer(delta):
	var time = delta * ((CombatData.Level / 3) + 1) * 100
	$Timer/CanvasLayer/Progress.value -= time
	$Timer/CanvasLayer/Label.text = str(int($Timer/CanvasLayer/Progress.value / 90))

func UpdateGold():
	$CanvasLayer/gold.text = str(CombatData.gold)
