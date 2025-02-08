extends Area3D


func _on_body_entered(body):
	if body.is_in_group("ENEMY"):
		body.WAKEUP()



func _on_body_exited(body):
	if body.is_in_group("ENEMY"):
		body.SLEEP()
