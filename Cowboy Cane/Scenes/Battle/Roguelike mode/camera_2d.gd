extends Camera3D

@export var Target : Node3D

func _ready():
	
	await  get_tree().process_frame
	await  get_tree().process_frame
	await  get_tree().process_frame
	
	Target.global_position = Variables.yasir.global_position
	$"../".global_position = Target.global_position

func _process(delta):
	
	if Target.global_position.distance_to(Variables.yasir.global_position) > 5:
		Target.global_position = Target.global_position.lerp(Variables.yasir.global_position, delta)
	
	$"../".global_position = $"../".global_position.slerp(Target.global_position, delta * 2)
