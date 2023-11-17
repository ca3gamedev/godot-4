extends Node2D

@export var distance : float
@export var speedcamera : float
@export var followspeed : float

func _process(delta):
	if self.global_position.distance_to(%Pacifica.global_position) > distance:
		if self.global_position.x < %Pacifica.global_position.x :
			self.global_position.x += delta * followspeed
		else:
			self.global_position.x -= delta * followspeed
	
	%Camera2D.global_position.x = lerp(%Camera2D.global_position.x, self.global_position.x, speedcamera)
