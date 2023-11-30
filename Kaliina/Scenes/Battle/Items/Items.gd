extends Node2D

func _ready():
	UpdateScore()

func UpdateScore():
	%GUI.get_node("ScoreLabel").text = str(CombatData.score)
