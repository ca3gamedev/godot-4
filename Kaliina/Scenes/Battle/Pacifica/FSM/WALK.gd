extends "res://Scenes/Battle/Pacifica/FSM/basic state.gd"

func Transition():
	if MyInput.get_node("InputCheck").GetIdle():
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	
	if MyInput.get_node("InputCheck").GetDash() != 0:
		%FSM.current = %FSM.get_node("DASH")
		%FSM.current.Start()
	
	if MyInput.get_node("InputCheck").GetButton() == "KICK":
		%FSM.current = %FSM.get_node("KICK")
		%FSM.current.StartAttack("KICK")

func Update():
	if MyInput.get_node("InputCheck").GetWalk() != 0:
		if MyInput.get_node("InputCheck").GetWalk() == -1:
			%Parent.scale.x = -1
			%Data.x_dir = -1
		else:
			%Parent.scale.x = 1
			%Data.x_dir = 1

func Start():
	var angle = %Anims.get("parameters/MOVE/blend_position")
	%Anims.set("parameters/MOVE/blend_position", Vector2(0.5, 0))

func Physics(delta):
	var speed = delta * %Data.walkspeed * %Data.x_dir
	$"../..".move_and_collide(Vector2(speed, 0))
