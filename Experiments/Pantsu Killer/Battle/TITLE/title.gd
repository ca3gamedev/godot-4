extends Node2D

@export var next : String
@export var deadtext : bool

func _ready():
	if deadtext :
		$deads.text = str(Variables.deads)

func _process(delta):
	if Input.is_action_just_released("Space"):
		Variables.ChangeScene(next)
