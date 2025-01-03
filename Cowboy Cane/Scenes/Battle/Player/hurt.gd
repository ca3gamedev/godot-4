extends Node

func Transition():
	pass

func Update(delta):
	pass

func Physics(delta):
	pass


func Start():
	%Anim.set("parameters/conditions/hurt", true)
	%Anim.set("parameters/HURT/blend_position", %FSM.dir)

func HIT():
	%FSM.current = %FSM.get_node("HURT")
	%FSM.current.Start()

func _on_hitbox_area_entered(area):
	
	if area.is_in_group("ENEMY"):
		HIT()
