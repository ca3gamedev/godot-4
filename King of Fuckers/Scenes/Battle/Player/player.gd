extends CharacterBody2D

@export var bullet : PackedScene
@export var bulletoffset : float

func _ready():
	Variables.Player = self

func _process(delta):
	
	if Input.is_action_just_released("SHOOT"):
		var tmp = bullet.instantiate()
		tmp.global_position = self.global_position + Vector2(0, bulletoffset)
		%Bullets.add_child(tmp)
