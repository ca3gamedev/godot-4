extends Node

@export var kickforce : float
@export var kickY : float
@onready var root = $"../../../.."

func _on_melee_body_entered(body):
	if body.is_in_group("Enemy"):
		body.get_parent().HIT(%Data.currentdamage)
		var angle = body.global_position - root.global_position
		angle.y = kickY
		#body.apply_impulse(angle * kickforce)
		Variables.get_node("Score").AddScore(1)
