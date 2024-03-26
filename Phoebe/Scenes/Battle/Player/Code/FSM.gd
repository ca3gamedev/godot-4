extends Node

@export var dir : Vector2i

func _process(delta):
	
	%Target.global_position = %Parent.global_transform.origin + Vector3(dir.x*-1, 0, dir.y*-1)
	%Rot.look_at_from_position(get_parent().global_position, %Target.global_position)
	%Parent.basis = %Parent.basis.slerp(%Rot.basis, 0.2)


func _on_state_machine_player_updated(state, delta):
	
	match state:
		"IDLE":
			$IDLE.Update(delta)
		"WALK":
			$Walk.Update(delta)


func _on_state_machine_player_transited(from, to):
	pass
