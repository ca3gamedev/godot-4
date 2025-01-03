extends Node

func Start():
	
	%Anim.set("parameters/conditions/punch", true)

func Transition():
	pass

func Update(delta):
	pass

func Physics(delta):
	pass



func _on_attackbox_area_entered(area):
	if area.is_in_group("BOSS"):
		Variables.GUI.HIT(1)
