extends Node2D


func _ready():
	await get_tree().process_frame
	RESET()

func _on_coin_area_entered(area):
	
	if area.is_in_group("ATTACKBOX"):
		RESET()
		Variables.GUI.COIN()
		
func RESET():
	var x = randf_range(Variables.TOPLEFT.global_position.x, Variables.BOTTOMRIGHT.global_position.x)
	var y = randf_range(Variables.TOPLEFT.global_position.y, Variables.BOTTOMRIGHT.global_position.y)
	self.global_position = Vector2(x, y)


func _on_visible_screen_screen_exited():
	RESET()
