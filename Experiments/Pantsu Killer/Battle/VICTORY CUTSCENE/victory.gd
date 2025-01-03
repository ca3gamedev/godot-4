extends Node2D

@export var next : String

func _on_animation_player_animation_finished(anim_name):
	
	Variables.ChangeScene(next)
