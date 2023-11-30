extends Node



func _on_rosa_collision_area_entered(area):
	
	if area.is_in_group("Rosa"):
		%FSM.Root.Attack = true
	
	if area.is_in_group("ENEMY"):
		%FSM.Root.myoff = true


func _on_rosa_collision_area_exited(area):
	
	if area.is_in_group("Rosa"):
		%FSM.Root.Attack = false
	
	if area.is_in_group("ENEMY"):
		%FSM.Root.myoff = false
