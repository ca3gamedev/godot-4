extends Node

func Update(delta):
	pass
	
func Physics(delta):
	pass

func Start():
	%Ani.set("parameters/conditions/attack", true)


func _on_ani_animation_finished(anim_name):
	if anim_name == "ATTACK" or anim_name == "HURT":
		%Ani.set("parameters/conditions/attack", false)
		%Ani.set("parameters/conditions/hurt", false)
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()


func _on_attack_timeout():
	if %FSM.current.name == "IDLE" or %FSM.current.name == "WAIT":
		%FSM.current = %FSM.get_node("ATTACK")
		%FSM.current.Start()

func ATTACK():
	if $"../..".PlayerRange:
		Variables.yasir.HIT()
