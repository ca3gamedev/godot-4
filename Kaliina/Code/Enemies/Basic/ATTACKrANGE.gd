extends Area3D


func _process(delta):
	self.global_position = %EnemyM.global_position


func _on_body_entered(body):
	
	if body.is_in_group("HPCore"):
		%EnemyM.sleepy = true
		%Sleepy.stop()
		%Bullet.start(5)
