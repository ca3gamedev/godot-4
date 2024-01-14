extends Node

@export var started : bool

@export var Battle : PackedScene

func _ready():
	%Continue.hide()
	%Title.hide()
	%GameOver.hide()
	%Reset.hide()


func SisterTween():
	%Continue.show()
	Music.StartIntro()


func _on_turn_on_button_up():
	if not started :
		%TurnOn.hide()
		%TurnedOff.hide()
		%Title.show()
		%Sisters.play("start")
		started = true


func _on_continue_button_up():
	CombatData.IsGame = true
	%Title.hide()
	var tmp = Battle.instantiate()
	%Game.add_child(tmp)
	%Continue.hide()
