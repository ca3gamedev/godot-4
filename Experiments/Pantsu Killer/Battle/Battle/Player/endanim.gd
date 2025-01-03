extends Node


func _on_anim_animation_finished(anim_name):
	
	if anim_name == "Punch":
		%Anim.set("parameters/conditions/punch", false)
		$"..".current = $"../".get_node("IDLE")
	
	if anim_name == "Hurt":
		%Anim.set("parameters/conditions/hurt", false)
		$"..".current = $"../".get_node("IDLE")
