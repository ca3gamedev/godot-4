extends Camera3D

@export var walk_speed : float
@export var dist : float

func _ready():
	await  get_tree().process_frame
	
	%Target.global_position = Variables.yasir.global_position
	$"../".global_position = Variables.yasir.global_position


func _physics_process(delta):
	var distance = Variables.yasir.global_position.distance_to(%Target.global_position)
	if distance > 10:
		%Target.global_position = %Target.global_position.lerp(Variables.yasir.global_position, delta * 10)
	
	$"../".global_position = $"../".global_position.slerp(%Target.global_position, delta * 2)
