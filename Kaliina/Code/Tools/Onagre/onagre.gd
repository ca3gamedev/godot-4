extends StaticBody3D

@export var ID : int
@export var boulder : PackedScene

func _ready():
	$AreaSprite.modulate = Color.SADDLE_BROWN

var mydelta = 0

func _process(delta):
	mydelta = delta

func SpawnBoulder(strenght):
	var tmp = boulder.instantiate()
	Variables.get_node("DataPaths").BoulderManager.add_child(tmp)
	tmp.global_position = $Spawn.global_position
	var angle = (global_position - Variables.get_node("DataPaths").Pacifica.global_position).normalized()
	var Ystrenght = angle * mydelta * Variables.get_node("CombatVars").boulderstrenght
	var vectorY = Vector3.UP * Variables.get_node("CombatVars").boulderY * mydelta
	tmp.apply_impulse(vectorY + ((Ystrenght * -1) * strenght))
	


func _on_activate_area_body_entered(body):
	if body.is_in_group("Rosa"):
		Variables.get_node("Code/BoulderSpawn").weaponactive = true
		Variables.get_node("CombatVars").boulderid = ID
		$AreaSprite.modulate = Color.RED


func _on_activate_area_body_exited(body):
	if body.is_in_group("Rosa"):
		Variables.get_node("Code/BoulderSpawn").weaponactive = false
		$AreaSprite.modulate = Color.SADDLE_BROWN
