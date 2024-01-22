extends Node

func Transition():
	if MyInput.get_node("Check").GetWalk() != Vector2i.ZERO:
		%FSM.current = %FSM.get_node("WALK")

func Update(delta):
	
	var angle = %Rotation.get("parameters/Rotation/blend_position")
	angle.x = lerp_angle(angle.x, %FSM.dir.x, delta * 4)
	angle.y = lerp_angle(angle.y, %FSM.dir.y, delta * 4)
	%Rotation.set("parameters/Rotation/blend_position", angle)
	
	var rot = %Parent.global_transform.looking_at(%Target.global_position, Vector3.UP)
	var target = %Parent.basis.slerp(rot.basis, delta * 4)
	%Parent.basis = target
	

func Physics(delta):
	pass
