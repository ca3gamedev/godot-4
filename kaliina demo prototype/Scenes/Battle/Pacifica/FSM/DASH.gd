extends "res://Scenes/Battle/Pacifica/FSM/basic state.gd"

func Transition():
	if MyInput.get_node("InputCheck").GetIdle():
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()

func Start():
	var angle = %Anims.get("parameters/MOVE/blend_position")
	%Anims.set("parameters/MOVE/blend_position", Vector2(1, 0))

func Physics(delta):
	var speed = delta * %Data.dashspeed * %Data.x_dir
	$"../..".move_and_collide(Vector2(speed, 0))
