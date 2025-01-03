extends Node

func _ready():
	Start()

func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT") or Input.is_action_pressed("DOWN") or Input.is_action_pressed("UP"):
		%FSM.current = %FSM.get_node("WALK")
	if Input.is_action_just_released("SLASH"):
		%FSM.current = %FSM.get_node("ATTACK1")
		%FSM.current.Start()

func Start():
	%Anim.set("parameters/MOVE/blend_position", %FSM.dir * 0.5)


func Update(delta):
	pass

func Physics(delta):
	pass
