extends Node

@export var FORWARD_SPEED = 2.0
@export var BACK_SPEED = 1.0
@export var TURN_SPEED = 0.025
var Vec3Z = Vector3.ZERO

func Transition():
	
	var idle = true
	
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		idle = false
	
	if idle:
		$"../".current = $"../IDLE"
	
func Update(delta):
	
	$"../..".velocity.x = 0
	$"../..".velocity.z = 0
	
	if Input.is_action_pressed("LEFT"):
		$"../..".rotation.z += Vec3Z.y - TURN_SPEED #* V_LOOK_SENS
		$"../..".rotation.z = clamp($"../..".rotation.x, -50, 90)
		$"../..".rotation.y += Vec3Z.y + TURN_SPEED #* M_LOOK_SENS
	if Input.is_action_pressed("RIGHT"):
		$"../..".rotation.z -= Vec3Z.y + TURN_SPEED #* V_LOOK_SENS
		$"../..".rotation.z = clamp($"../..".rotation.x, -50, 90)
		$"../..".rotation.y -= Vec3Z.y + TURN_SPEED #* M_LOOK_SENS
	if Input.is_action_pressed("UP"):
		var forwardVector = -Vector3.FORWARD.rotated(Vector3.UP, $"../..".rotation.y)
		$"../..".velocity = -forwardVector * FORWARD_SPEED
	if Input.is_action_pressed("DOWN"):
		var backwardVector = Vector3.FORWARD.rotated(Vector3.UP, $"../..".rotation.y)
		$"../..".velocity = -backwardVector * BACK_SPEED
	if Input.is_action_pressed("DOWN") and Input.is_action_pressed("LEFT"):
		$"../..".rotation.z -= Vec3Z.y + TURN_SPEED #* V_LOOK_SENS
		$"../..".rotation.z = clamp($"../..".rotation.x, -50, 90)
		$"../..".rotation.y -= Vec3Z.y + TURN_SPEED #* M_LOOK_SENS
	if Input.is_action_pressed("DOWN") and Input.is_action_pressed("RIGHT"):
		$"../..".rotation.z += Vec3Z.y - TURN_SPEED #* V_LOOK_SENS
		$"../..".rotation.z = clamp($"../..".rotation.x, -50, 90)
		$"../..".rotation.y += Vec3Z.y + TURN_SPEED #* M_LOOK_SENS

	
func Physics(delta):
	$"../../".move_and_slide()
