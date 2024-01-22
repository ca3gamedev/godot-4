extends Node

@export var walkspeed : float

func Start():
	pass

func Transition():
	
	if %FSM.get_parent().IsCombat:
		if %FSM.id == 0 and CombatData.IsPacifica:
			%FSM.current = %FSM.get_node("IDLE")
			%FSM.current.Start()
		
		if %FSM.id == 1 and not CombatData.IsPacifica:
			%FSM.current = %FSM.get_node("IDLE")
			%FSM.current.Start()
	
	var idle = MyInput.get_node("Check").GetWalk()
	
	if idle == Vector2i.ZERO:
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	
	var dash = MyInput.get_node("Check").GetDash()
	if dash != Vector2i.ZERO:
		%FSM.current = %FSM.get_node("DASH")
		%FSM.current.Start()

func Update():
	var idle = MyInput.get_node("Check").GetWalk() * 0.5
	
	var angle = %Anim.get("parameters/MOVE/blend_position")
	if idle != angle:
		idle.y *= -1
		%Anim.set("parameters/MOVE/blend_position", idle)

func Physics(delta):
	var speed = MyInput.get_node("Check").GetWalk() * walkspeed * delta
	
	%FSM.get_parent().move_and_collide(speed)
