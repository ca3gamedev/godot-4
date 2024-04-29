extends Node2D

func _ready() -> void:
	DataPath.DungeonGUI = self

func Walk(delta):
	
	$CanvasLayer/NextBattle.value += delta * 10
	
	if $CanvasLayer/NextBattle.value > 99:
		$CanvasLayer/NextBattle.value = 0
		CombatData.StartBattle()
		self.set_process(false)

func ResetWalk():
	$CanvasLayer/NextBattle.value = 0
