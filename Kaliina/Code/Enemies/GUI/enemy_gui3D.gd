extends Node3D

@export var MyOffset : Vector3

func _physics_process(delta):
	var target = %EnemyM.global_position + MyOffset
	
	self.global_position = self.global_position.slerp(target, 0.2)
