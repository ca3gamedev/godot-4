extends Camera2D

@export var Pacifica : CharacterBody2D
@export var Rosa : CharacterBody2D
@export var speed : float


func process(delta):
	var dir = Vector2.ZERO
	var dir_n = Vector2.ZERO
	if not CombatData.IsPacifica:
		dir =  Pacifica.global_position - self.global_position
	else:
		dir =  Rosa.global_position - self.global_position
	dir_n = dir.normalized()
	
	if abs(dir.x) > 300 or abs(dir.y) > 50:
		self.global_position += delta * dir_n * speed
