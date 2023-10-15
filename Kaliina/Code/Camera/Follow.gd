extends Node3D

@export var Player : CharacterBody3D
@export var distance : float
@export var distance_camera : float


func _process(delta):
	if Player.global_position.distance_to(self.global_position) > distance_camera:
		var angle = Player.global_position - self.global_position
		angle.y = 0
		angle = angle.normalized()
		self.global_position += angle
	
	%Camera.global_position = %Camera.global_position.slerp(self.global_position, 0.1)
	
