extends Node2D

@export var left : float
@export var right : float
@export var isleft : bool

func _ready() -> void:
	self.position.x = left
	UpdateCoins()

func UpdateCoins():
	%COINS.text = str(Variables.coins)

func Switch():
	if isleft:
		Move_Right()
	else:
		Move_Left()

func Move_Right():
	var tween = create_tween()
	tween.tween_property(self, "position:x", right, 1)

func Move_Left():
	var tween = create_tween()
	tween.tween_property(self, "position:x", left, 1)


func _on_switch_pressed() -> void:
	if self.position.x == left or self.position.x == right:
		Switch()

func HIDECOIN():
	%coinparent.hide()

func SHOWCOIN():
	%coinparent.show()
