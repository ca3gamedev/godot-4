extends Node2D

@export var offset_y : int

func Update(question, answer):
	$Question.text = question
	$Answer.text = answer
