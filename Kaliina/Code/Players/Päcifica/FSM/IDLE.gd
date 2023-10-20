extends "res://Code/Players/Päcifica/FSM/basic.gd"

func Transition():
	
	var check = %Checks.GetInput()
	if check.x == 2:
		%FSM.current = %FSM.get_node("DASH")
		%FSM.current.Start()
	if check.x == 1:
		%FSM.current = %FSM.get_node("WALK")
		%FSM.current.Start()

	if %Checks.GetButtons() == "A r":
		%Array.ClearButtons()
		%Attacks.CallAttacks("basic kick")
		

func Update():
	var angle = %AnimsTree.get("parameters/MOVE/blend_position")
	angle = lerp(angle, Vector2(0, 0), 0.2)
	%AnimsTree.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	$"../../..".move_and_collide(Vector3.DOWN * delta)

func Start():
	pass
