extends Area3D

var empty = false

func _ready():
	$door.material_override.albedo_color = Color.GRAY

func _process(delta):
	
	if not empty:
		if get_tree().get_nodes_in_group("KEYS").size() == 0 :
			empty = true
			$door.material_override.albedo_color = Color.BLACK
			$CollisionShape3D.disabled = false


func _on_area_entered(area):
	Variables.ChangeScene("GAME OVER")
