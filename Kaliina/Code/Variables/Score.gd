extends Node

@export var SCORE : int

func ResetScore():
	SCORE = 0
	
func AddScore(score):
	
	SCORE += score
	%DataPaths.myGUI.UpdateSCORE()
