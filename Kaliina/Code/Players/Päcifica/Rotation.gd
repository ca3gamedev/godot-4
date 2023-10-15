extends Node

func _process(delta):
	
	## CALCULATE THE FIRST ROTATION
	
	var tmp = %Parent.global_rotation
	var pos = %Parent.global_position + Vector3(%Data.dir.x*-1, 4, %Data.dir.y*-1)
	%look_check.look_at_from_position(%Parent.global_position, pos, Vector3.UP)
	var target = %look_check.global_rotation
	target.x *= -1
	var new_angle = tmp
	new_angle.y = lerp_angle(tmp.y, target.y, 0.2)
	
	## CALCULATE THE Y OFFSET
	var yoffnewangle = Vector3.ZERO
	var yoff = 0
	if %Data.dir.y == 1:
		yoff = -2
		var tmp2 = %Parent.global_position
		tmp2.y = 4
		tmp2.z += yoff
		%track.global_position = tmp2
		
		%look_check.look_at_from_position(%Parent.global_position, tmp2, Vector3.UP)
		var target2 = %look_check.global_rotation
		yoffnewangle.x = lerp_angle(new_angle.x, target2.x, 0.2)
	
	%Yoffrotation.global_rotation.x = yoffnewangle.x
	%Parent.global_rotation = new_angle
