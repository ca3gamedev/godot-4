extends Node

@export var dashspeed : float

func Start():
	pass

func Transition():
	
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

func Update():
	
	var idle : Vector2
	idle = MyInput.get_node("Check").GetWalk()
	
	var angle = %Anim.get("parameters/MOVE/blend_position")
	if idle != angle:
		idle.y *= -1
		%Anim.set("parameters/MOVE/blend_position", idle)

func Physics(delta):
	var speed = MyInput.get_node("Check").GetWalk() * dashspeed * delta
	
	%FSM.get_parent().move_and_collide(speed)
