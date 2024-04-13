extends Node

var dir = 1.0

@export var walk_speed : float

func Transition():
	if %Command.GetArrows().x == 0:
		%FSM.current = %FSM.get_node("IDLE")
	if %Command.GetDash():
		%FSM.current = %FSM.get_node("DASH")
		
	if %Command.GetArrows().y == 1:
		%FSM.current = %FSM.get_node("CROUCH")

func Update(delta):
	dir = %Command.GetArrows().x
	
	var angle = %Rots.get("parameters/MOVE/blend_position")
	angle = lerp(angle, float(dir), delta * 10)
	%Rots.set("parameters/MOVE/blend_position", angle)
	
	angle = %Anims.get("parameters/MOVE/blend_position")
	angle = angle.lerp(Vector2(0.5, 0), delta * 10)
	%Anims.set("parameters/MOVE/blend_position", angle)
	
	angle = %POS.get("parameters/MOVE/blend_position")
	angle = angle.lerp(Vector2(0.5, 0), delta * 10)
	%POS.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	
	var speed = Vector3(walk_speed * dir * delta, 0, 0)
	%FSM.get_parent().move_and_collide(speed)
