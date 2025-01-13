extends Area3D


func _on_area_entered(area):
	
	if area.is_in_group("ATTACKBOX"):
		self.queue_free()
