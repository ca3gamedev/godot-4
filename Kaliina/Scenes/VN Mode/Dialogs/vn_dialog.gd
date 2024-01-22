extends Node2D

@export var id : int
@export var world : String
@export var dialog : String


func _ready():
	ShowDialog()

func ShowDialog():
	
	var text = $Dialogs.GetText(world, dialog, id)
	if text != null:
		$Text.text = text
	
	var pic = $Dialogs.GetPicture(world, dialog, id)
	SetPicture(pic)


func _process(delta):
	
	if Input.is_action_just_released("SHOOT"):
		id += 1
		ShowDialog()

func SetPicture(pic):
	
	if pic == "Pacifica":
		$Portraits.global_position = $Pacifica.global_position
		$Portraits.frame = 0
	if pic == "Rosa":
		$Portraits.global_position = $Rosa.global_position
		$Portraits.frame = 1
