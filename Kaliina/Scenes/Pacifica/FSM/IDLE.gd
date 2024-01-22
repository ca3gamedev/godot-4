extends Node

func Start():
	%Anim.set("parameters/MOVE/blend_position", Vector2.ZERO)

func Transition():
	
	if %FSM.get_parent().IsCombat:
		if %FSM.id == 0 and CombatData.IsPacifica:
			return
		if %FSM.id == 1 and not CombatData.IsPacifica:
			return
	
	var walk = MyInput.get_node("Check").GetWalk()
	if walk != Vector2i.ZERO:
		%FSM.current = %FSM.get_node("WALK")
		%FSM.current.Start()
	
	var dash = MyInput.get_node("Check").GetDash()
	if dash != Vector2i.ZERO:
		%FSM.current = %FSM.get_node("DASH")
		%FSM.current.Start()

func Update():
	pass

func Physics(delta):
	pass
