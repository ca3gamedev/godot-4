extends Node

func Transition():
	if %Command.GetArrows().x != 0 and %Command.GetArrows().y == 0:
		%FSM.current = %FSM.get_node("WALK")
	
	if %Command.GetArrows().x == 0 and %Command.GetArrows().y == 1:
		%FSM.current = %FSM.get_node("CROUCH")
	
	if %Command.GetDash():
		%FSM.current = %FSM.get_node("DASH")

func Update(delta):
	
	
	var angle = %Rots.get("parameters/MOVE/blend_position")
	if %WALK.dir == 1 :
		angle = lerp(angle, 0.3, delta * 10)
	else:
		angle = lerp(angle, -1.0, delta * 10)
	%Rots.set("parameters/MOVE/blend_position", angle)
	
	angle = %Anims.get("parameters/MOVE/blend_position")
	angle = angle.lerp(Vector2(0, 0), delta * 10)
	%Anims.set("parameters/MOVE/blend_position", angle)
	
	angle = %POS.get("parameters/MOVE/blend_position")
	angle = angle.lerp(Vector2(0, 0), delta * 10)
	%POS.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	pass
