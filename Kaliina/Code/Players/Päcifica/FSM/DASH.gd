extends "res://Code/Players/Päcifica/FSM/basic.gd"

func Transition():
	var check = %Checks.GetInput()
	if check.x == 0:
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	if check.x == 1:
		%FSM.current = %FSM.get_node("WALK")
		%FSM.current.Start()

func Update():
	var check = %Checks.GetInput()
	if check.x == 2:
		var dir = Vector2(check.y, check.z)
		%Data.dir = dir
	
	var angle = %AnimsTree.get("parameters/MOVE/blend_position")
	angle = lerp(angle, Vector2(0.9, 0), 0.2)
	%AnimsTree.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	var speed = %Data.dir * %Data.dash_speed * delta * 100
	%Data.Root.velocity = Vector3(speed.x, 0, speed.y)
	%Data.Root.move_and_slide()
