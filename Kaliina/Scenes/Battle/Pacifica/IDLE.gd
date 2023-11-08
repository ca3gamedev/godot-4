extends "res://Scenes/Battle/Pacifica/FSM/basic state.gd"

func Transition():
	if MyInput.get_node("InputCheck").GetWalk() != 0:
		%FSM.current = %FSM.get_node("WALK")
		%FSM.current.Start()
	if MyInput.get_node("InputCheck").GetDash() != 0:
		%FSM.current = %FSM.get_node("DASH")
		%FSM.current.Start()
	if MyInput.get_node("InputCheck").GetButton() == "KICK":
		%FSM.current = %FSM.get_node("KICK")
		%FSM.current.StartAttack("KICK")

func Start():
	var angle = %Anims.get("parameters/MOVE/blend_position")
	%Anims.set("parameters/MOVE/blend_position", Vector2(0, 0))
	
