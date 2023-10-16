extends CharacterBody3D

@export var boulder : PackedScene

var mydelta = 0

func _process(delta):
	mydelta = delta

func SpawnBoulder():
	var tmp = boulder.instantiate()
	tmp.global_position = $Spawn.global_position
	Variables.get_node("DataPaths").BoulderManager.add_child(tmp)
	var angle = (global_position - Variables.get_node("DataPaths").Pacifica.global_position).normalized()
	var Ystrenght = angle * mydelta * Variables.get_node("CombatVars").boulderstrenght
	var vectorY = Vector3.UP * Variables.get_node("CombatVars").boulderY * mydelta
	tmp.apply_impulse(vectorY + (Ystrenght * -1))
	
