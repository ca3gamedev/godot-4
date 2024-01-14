extends Node2D

func _ready():
	UpdateScore()

func UpdateScore():
	MyGUI.get_node("ScoreLabel").text = str(CombatData.score)
