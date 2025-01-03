extends Node3D


func _on_bottom_left_body_entered(body):
	
	if body.is_in_group("PLAYER"):
		$BottomLeft.current = true
		$BottomRight.current = false
		$CenterLeft.current = false
		$CenterRight.current = false
		$Door.current = false



func _on_bottom_right_body_entered(body):
	if body.is_in_group("PLAYER"):
		$BottomLeft.current = false
		$BottomRight.current = true
		$CenterLeft.current = false
		$CenterRight.current = false
		$Door.current = false



func _on_center_left_body_entered(body):
	if body.is_in_group("PLAYER"):
		$BottomLeft.current = false
		$BottomRight.current = false
		$CenterLeft.current = true
		$CenterRight.current = false
		$Door.current = false



func _on_center_right_body_entered(body):
	if body.is_in_group("PLAYER"):
		$BottomLeft.current = false
		$BottomRight.current = false
		$CenterLeft.current = false
		$CenterRight.current = true
		$Door.current = false


func _on_door_body_entered(body):
	
	if body.is_in_group("PLAYER"):
		$BottomLeft.current = false
		$BottomRight.current = false
		$CenterLeft.current = false
		$CenterRight.current = false
		$Door.current = true
