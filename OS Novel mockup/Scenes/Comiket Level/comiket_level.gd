extends Node3D


@export var x_pos : int = 1
@export var x_offset : float
@export var rot_angle : int = 0

@onready var initial_pos = $Camera3D.global_position

@onready var idle = true

func _ready() -> void:
	x_pos = Variables.x_pos
	rot_angle = Variables.rot_angle

func _process(delta: float) -> void:
	
	
	if idle:
		if Input.is_action_just_released("UP"):
			idle = false
			if rot_angle < -1 or rot_angle > 1:
				if x_pos > 0:
					x_pos -= 1
			else:
				if x_pos < 15:
					x_pos += 1
		if Input.is_action_just_released("DOWN"):
			idle = false
			if rot_angle < -1 or rot_angle > 1:
				if x_pos < 15:
					x_pos += 1
			else:
				if x_pos > 0:
					x_pos -= 1
		
		if global_rotation.y == 0 or global_rotation.y == 90 or global_rotation.y == -90 or global_rotation.y == 180:
			if Input.is_action_just_released("LEFT") and rot_angle > -2:
				idle = false
				rot_angle -= 1
				
			if Input.is_action_just_released("RIGHT") and rot_angle < 2:
				idle = false
				rot_angle += 1
	
	if rot_angle > 2:
		rot_angle = 2
	if rot_angle < -2:
		rot_angle = -2
		
	var rot_target = -90
	match(rot_angle):
		-2 : rot_target = 90
		-1 : rot_target = 0
		0 : rot_target = -90
		1 : rot_target = -180
		2 : rot_target = -270
	
	$Camera3D.global_rotation.y = lerp_angle($Camera3D.global_rotation.y, deg_to_rad(rot_target), delta * 2)
		
	var target = initial_pos + Vector3(x_pos * x_offset, 0, 0)
	$Camera3D.global_position = lerp($Camera3D.global_position, target, delta * 2)


func _on_gallery_area_entered(area: Area3D) -> void:
	$"../".EnterStore("Sailor Moon Gallery")


func _on_gallery_area_exited(area: Area3D) -> void:
	$"../".HideStore()


func _on_novels_area_entered(area: Area3D) -> void:
	$"../".EnterStore("Sailor Moon Novels")


func _on_novels_area_exited(area: Area3D) -> void:
	$"../".HideStore()


func _on_action_timeout() -> void:
	idle = true


func _on_one_shot_area_entered(area: Area3D) -> void:
	$"../".EnterStore("Sailor Moon OneShot")


func _on_one_shot_area_exited(area: Area3D) -> void:
	$"../".HideStore()


func _on_left_pressed() -> void:
	if rot_angle > -2:
		rot_angle -= 1


func _on_right_pressed() -> void:
	
	if  rot_angle < 2:
		rot_angle += 1


func _on_up_pressed() -> void:
	if rot_angle < -1 or rot_angle > 1:
		if x_pos > 0:
			x_pos -= 1
	else:
		if x_pos < 15:
			x_pos += 1


func _on_down_pressed() -> void:
	if rot_angle < -1 or rot_angle > 1:
		if x_pos < 15:
			x_pos += 1
	else:
		if x_pos > 0:
			x_pos -= 1
