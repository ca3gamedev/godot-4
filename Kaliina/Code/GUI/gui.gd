extends Node2D


func _ready():
	UpdateHP()

func UpdateHP():
	$CanvasLayer/HPLabel.text = str(Variables.get_node("Code/HPHit").HP)
