extends Node

	
func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		%FSM.current = %FSM.get_node("WALK")
	if Input.is_action_just_released("SLASH"):
		%FSM.current = %FSM.get_node("ATTACK1")
		%FSM.current.Start()

func Update(delta):
	var angle = %Anim.get("parameters/MOVE/blend_position")
	angle = lerp(Vector2(angle.x, angle.y), Vector2(0.0, 0.0), delta * 10)
	%Anim.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	pass

func Start():
	pass
