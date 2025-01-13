extends Node2D

@export var walk_speed : float
@export var target : Vector2

func _physics_process(delta):
	
	target = (Variables.yasir.global_position - global_position).normalized()
	
	
	global_position = global_position.slerp(global_position + target, delta * walk_speed)


func _on_area_2d_area_entered(area):
	
	if area.is_in_group("MISSILE"):
		var chance = randi_range(1, 4)
		match (chance):
			1 : self.position.x = 0
			2 : self.position.x = 1080
			3 : self.position.y = 0
			4 : self.position.y = 580


func _on_visible_screen_screen_exited():
	RESET()

func RESET():
	var x = Variables.BOTTOMRIGHT.global_position.x
	var y = randf_range(Variables.TOPLEFT.global_position.y, Variables.BOTTOMRIGHT.global_position.y)
	self.global_position = Vector2(x, y)
