extends Node2D

@export var myframe : int = 0

func _ready() -> void:
	$Sprites.frame = myframe
	$Frame.hide()

func ChangeSprite(frame):
	myframe = frame
	$Sprites.frame = myframe


func _on_button_mouse_entered() -> void:
	$Frame.show()


func _on_button_mouse_exited() -> void:
	$Frame.hide()


func _on_button_pressed() -> void:
	$"../".current_picture = myframe
	$"../".ShowBigger()
