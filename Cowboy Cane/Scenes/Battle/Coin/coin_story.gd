extends Node2D


func _on_coin_area_entered(area):
	
	if area.is_in_group("ATTACKBOX"):
		self.queue_free()
