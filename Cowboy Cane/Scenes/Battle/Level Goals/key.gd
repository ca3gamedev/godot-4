extends Area3D

func _process(delta):
	
	$MeshInstance3D.rotate_y(delta)


func _on_area_entered(area):
	if area.is_in_group("PLAYER"):
		Variables.GUI.Key()
		self.queue_free()
