extends Node2D

@export var myframe : int = 0

func _ready() -> void:
	$Sprites.frame = myframe

func ChangeSprite(frame):
	myframe = frame
	$Sprites.frame = myframe


func _on_button_pressed() -> void:
	$"../".HideBigger()


func _on_scroll_value_changed(value: float) -> void:
	$Sprites.position.y = value
	$Paper.position.y = value - 50

func Intro():
	var papertween = create_tween()
	var spritetween = create_tween()
	
	$Paper.position.y = 680
	$Sprites.position.y = 748
	
	papertween.tween_property($Paper, "position:y", -22, 1)
	spritetween.tween_property($Sprites, "position:y", 46, 1)
