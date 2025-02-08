extends Camera3D

@export var Target : Node3D
@onready var offset = self.position
var mypause = false
var followcamera = false

func _ready():
	
	Variables.Camera = self
	
	await  get_tree().process_frame
	await  get_tree().process_frame
	await  get_tree().process_frame
	
	Target.global_position = Variables.yasir.global_position
	$"../".global_position = Target.global_position

func _process(delta):
	
	if Input.is_action_just_released("Camera"):
		Variables.camera_roam = !Variables.camera_roam
	
	if Input.is_action_just_released("pause"):
		mypause = !mypause
		get_tree().paused = mypause
	
	if Input.is_action_just_released("camerafollow"):
		followcamera = !followcamera
	
	if followcamera:
		self.position = self.position.slerp(offset, delta * 10)
	
	if not Variables.camera_roam:
		if Target.global_position.distance_to(Variables.yasir.global_position) > 1:
			Target.global_position = Target.global_position.lerp(Variables.yasir.global_position, delta)
	
		$"../".global_position = $"../".global_position.slerp(Target.global_position, delta * 2)
	
	if Input.is_action_pressed("leftcamera"):
		self.position.x -= delta * 10
	if Input.is_action_pressed("rightcamera"):
		self.position.x += delta * 10
	if Input.is_action_pressed("upcamera"):
		self.position.z += delta * 10
	if Input.is_action_pressed("downcamera"):
		self.position.z -= delta * 10
	if Input.is_action_pressed("cameraleft"):
		self.position.y += delta * 10
	if Input.is_action_pressed("cameraright"):
		self.position.y -= delta * 10
	if Input.is_action_pressed("cameraup"):
		self.rotate_y(delta)
		self.rotation.z = 0
	if Input.is_action_pressed("cameradown"):
		self.rotate_y(-delta)
		self.rotation.z = 0
	if Input.is_action_pressed("camerarotup"):
		self.rotate_x(delta)
		self.rotation.z = 0
	if Input.is_action_pressed("camerarotdown"):
		self.rotate_x(-delta)
		self.rotation.z = 0
