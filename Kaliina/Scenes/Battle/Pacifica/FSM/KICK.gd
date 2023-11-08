extends "res://Scenes/Battle/Pacifica/FSM/basic state.gd"


func StartAttack(type):
	
	var dir = Vector2.ZERO
	
	match (type):
		"KICK" : dir = Vector2.ZERO
	
	%Anims.set("parameters/Attack/blend_position", dir)
	%Anims.set("parameters/conditions/Attack", true)
	%FSM.state_machine.travel("Attack")

func EndAttack():
	%Anims.set("parameters/Attack/blend_position", Vector2.ZERO)
	%Anims.set("parameters/conditions/Attack", false)
	%FSM.state_machine.travel("MOVE")
	%FSM.current = %FSM.get_node("IDLE")
	%FSM.current.Start()
