extends CharacterBody3D

@export var Pacifica : CharacterBody3D

var close = false

var speed = 3
var accel = 10

func _process(delta):
	
	if %Input.walk and not close:
		var dir = Vector3.ZERO
		
		%nav.target_position = Pacifica.global_position
		
		dir = %nav.get_next_path_position() - self.global_position
		dir = dir.normalized()
		
		self.velocity = velocity.lerp(dir * speed, accel * delta)
		
		move_and_slide()


func _on_close_body_entered(body):
	
	if body.is_in_group("Pacifica"):
		close = true


func _on_close_body_exited(body):
	
	if body.is_in_group("Pacifica"):
		close = false
