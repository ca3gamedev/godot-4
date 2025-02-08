extends Node

func Start():
	%Anim.set("parameters/conditions/attack", true)
	%Anim.set("parameters/ATTACK1/blend_position", %FSM.dir)

func Transition():
	pass

func Update(delta):
	pass

func Physics(delta):
	pass

func END():
	%Anim.set("parameters/conditions/attack", false)
	%Anim.set("parameters/conditions/hurt", false)
	%FSM.current = %FSM.get_node("IDLE")
	%FSM.current.Start()


func _on_anim_animation_finished(anim_name):
	END()


func _on_hitbox_hit_body_entered(body):
	if body.is_in_group("ENEMY"):
		body.HIT()
