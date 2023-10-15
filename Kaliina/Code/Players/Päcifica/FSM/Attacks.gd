extends Node

@onready var AnimState  = %AnimsTree.get("parameters/playback")

func EndAttack():
	%AnimsTree.set("parameters/conditions/MELEE", false)
	%AnimsTree.set("parameters/conditions/Idle", true)
	%FSM.current = %FSM.get_node("IDLE")
	AnimState.travel("MOVE")

func CallAttacks(attack):
	%AnimsTree.set("parameters/conditions/MELEE", true)
	match(attack):
		"basic kick": 
			%FSM.current = %FSM.get_node("Attacks/BasicKick")
	%FSM.current.Start()
