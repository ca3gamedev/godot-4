extends Node

func Transition(delta):
	pass

func Update(delta):
	pass

func Physics(delta):
	pass


func _on_hitbox_area_entered(area):
	
	if area.is_in_group("Attack"):
		Music.HIT()
		%Ani.play("HIT")
		$"../..".HIT()
		Variables.GUI.HIT()
		%FSM.current = %FSM.get_node("HURT")


func _on_ani_animation_finished(anim_name):
	
	if anim_name == "HIT":
		%FSM.current = %FSM.get_node("IDLE")
