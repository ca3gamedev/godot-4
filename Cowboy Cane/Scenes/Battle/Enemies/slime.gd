extends CharacterBody3D

var PlayerRange = false
@export var HP : int

func _ready():
	$HP3D/SubViewport/HP/HP.max_value = HP
	$HP3D/SubViewport/HP/HP.value = HP


func WAKEUP():
	$WALK.start(randi_range(1, 3))
	$FSM.current = $FSM/IDLE
	$ATTACK.start(randf_range(2, 4))

func SLEEP():
	$WALK.stop()
	$ATTACK.stop()
	$FSM.current = $FSM/WAIT

func HIT():
	
	if $HP3D/SubViewport/HP/HP.value < 1:
		SLEEP()
		%FSM.current = %FSM.get_node("DIE")
		%FSM.current.Start()
		$WALK.stop()
	else:
		%FSM.current = %FSM.get_node("HURT")
		%FSM.current.Start()
		$HP3D/SubViewport/HP/HP.value -= 5
