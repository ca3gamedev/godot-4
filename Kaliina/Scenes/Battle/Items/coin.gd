extends Area2D



func _on_body_entered(body):
	if body.is_in_group("PLAYER"):
		CombatData.score += randi_range(1, 10)
		get_parent().UpdateScore()
		self.queue_free()
