extends Node

@export var Root : CharacterBody3D

func Update(delta):
	%lookat.look_at(Variables.yasir.global_position)
	%slime.rotation.y = lerp_angle(%slime.rotation.y, %lookat.rotation.y, delta)
	var angle = %Ani.get("parameters/MOVE/blend_position")
	angle = lerp(angle, Vector2(0.5, 0), delta * 5)
	%Ani.set("parameters/MOVE/blend_position", angle)
	
func Physics(delta):
	if Root.global_position.distance_to(Variables.yasir.global_position) > 3:
		%Agent.set_target_position(Variables.yasir.global_position)
		var next = %Agent.get_next_path_position()
		var current = Root.global_position
		var vel = (next - current).normalized() * %FSM.walk_speed
		Root.velocity = vel
		Root.move_and_slide()


func _on_walk_timeout():
	if %FSM.current.name == "IDLE" or %FSM.current.name == "WAIT":
		%FSM.current = %FSM.get_node("WALK")
		%FSM.current.Start()
	elif %FSM.current.name == "WALK":
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()

func Start():
	%Ani.set("parameters/conditions/hurt", false)
	%Ani.set("parameters/conditions/attack", false)
