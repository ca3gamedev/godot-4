extends CharacterBody2D

@export var Pacifica : bool

func _ready() -> void:
	DataPath.Pacifica = self
	ChangeSprite()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.Jump()

func ChangeSprite():
	if Pacifica:
		%Pacifica.show()
		%Rosa.hide()
	else:
		%Pacifica.hide()
		%Rosa.show()

func GetDir():
	return %WALK.dir

func GetLastDir():
	return %WALK.lastdir

