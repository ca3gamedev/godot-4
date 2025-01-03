extends CharacterBody3D

@export var mesh : MeshInstance3D

func _process(delta):
	var light_angle = $FSM.dir.x
	mesh.material_override.set("shader_parameter/light_angle", light_angle)
