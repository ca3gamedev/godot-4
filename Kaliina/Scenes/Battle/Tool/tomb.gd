extends Node2D

@export var GUI : CanvasLayer
@export var Next : String
@export var Filled : bool
@export var MaxScore : int

func _ready():
	MyGUI.GameLoaded()
	MyGUI.Reset()
	$Tomb.modulate = Color.DARK_BLUE
	MyGUI.get_node("SuperStock").max_value = MaxScore

func _process(delta):
	
	if MyGUI.get_node("SuperStock").value >= MaxScore:
		print()
		$Tomb.modulate = Color.RED
		Filled = true
	else:
		$Tomb.modulate = Color.DARK_BLUE
		Filled = false


func _on_tomb_area_body_entered(body):
	#if body.is_in_group("PLAYER") and Filled:
	Music.WinClap()
	Music.StopMusic()
	var tmp = load(Next)
	var nextscene = tmp.instantiate()
	get_tree().get_root().get_node("Root").EndBattle()
