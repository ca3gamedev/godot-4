extends Node

var next : String
var begin : bool
var score : int
var deads : int

@export var GUI : Node2D
@export var TOPLEFT : Marker2D
@export var BOTTOMRIGHT : Marker2D
@export var Player : CharacterBody2D
@export var BOSS : CharacterBody2D

func ChangeScene(scene):
	$Anim.play("transition")
	next = scene
	begin = true



func _on_anim_animation_finished(anim_name):
	
	if begin:
		begin = false
		var mynext = "res://Battle/Scene01/scene_01.tscn"
		
		match (next):
			"TITLE" : 
				Music.Stop()
				mynext = "res://Battle/TITLE/title.tscn"
			"INSTRUCTIONS" : 
				RESET()
				Music.Stop()
				Music.play("intro")
				mynext = "res://Battle/TITLE/instructions.tscn"
			"01" : mynext = "res://Battle/Scene01/scene_01.tscn"
			"02" : mynext = "res://Battle/Scene02/scene_02.tscn"
			"03" : 
				Music.Stop()
				Music.play("playground")
				mynext = "res://Battle/Battle/Level/level.tscn"
			"04" : 
				Music.Stop()
				mynext = "res://Battle/BOSS CUTSCENE/cutscene.tscn"
			"06" : 
				Music.Stop()
				Music.play("boss")
				mynext = "res://Battle/BOSS CUTSCENE/videofinal.tscn"
			"FINAL BATTLE" : mynext = "res://Battle/Final Battle/final_battle.tscn"
			"GAME OVER" : 
				Music.Stop()
				mynext = "res://Battle/TITLE/gameover.tscn"
			"VICTORY" : 
				Music.Stop()
				Music.play("END")
				mynext = "res://Battle/VICTORY CUTSCENE/victory.tscn"
			"colofon" : mynext = "res://Battle/VICTORY CUTSCENE/colofon.tscn"
		get_tree().change_scene_to_file(mynext)
		if anim_name == "transition":
			$Anim.play("ending")

func RESET():
	score = 0
	deads = 0

func PlayHit():
	$Hit.play()
