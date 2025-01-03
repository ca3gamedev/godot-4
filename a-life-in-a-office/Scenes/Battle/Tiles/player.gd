extends Node2D

@export var id : int
var target

func _ready():
	target = %"Belt".GetPos(id)

func _process(delta):
	global_position = global_position.slerp(target, delta * 10)
	

func WALKLEFT():
	if id > 0:
		id -= 1

func DOUBLERIGHT():
	if id + 2 < %"Belt".size - 1:
		id += 2
		target = %"Belt".GetPos(id)

func WALKRIGHT():
	if id < %"Belt".size - 1:
		id += 1
		target = %"Belt".GetPos(id)
		
		var type = %"Belt".GetType(id)
		if type != 3:
			%"Belt".Clear(id)
		match(type):
			0 : 
				WALKLEFT()
				WALKLEFT()
			1 :
				WALKLEFT()
				WALKLEFT()
				WALKLEFT()
			2 :
				WALKLEFT()
