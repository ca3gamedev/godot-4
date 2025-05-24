extends Node2D

@export var current_picture : int = 0

func _ready() -> void:
	HideBigger()


func HideBigger():
	$Bigger.hide()

func ShowBigger():
	$Bigger.ChangeSprite(current_picture)
	$Bigger.show()
	$Bigger.Intro()
