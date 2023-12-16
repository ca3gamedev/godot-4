extends Node2D

@export var GUI : CanvasLayer
@export var Next : String
@export var Filled : bool
@export var MaxScore : int

func _ready():
	$Tomb.modulate = Color.DARK_BLUE
	GUI.get_node("SuperStock").max_value = MaxScore
	GUI.get_node("SuperStock").value = 0

func _process(delta):
	
	if GUI.get_node("SuperStock").value >= MaxScore:
		print()
		$Tomb.modulate = Color.RED
		Filled = true
	else:
		$Tomb.modulate = Color.DARK_BLUE
		Filled = false


func _on_tomb_area_body_entered(body):
	if body.is_in_group("PLAYER") and Filled:
		get_tree().change_scene_to_file(Next)
