extends Node2D

@export var Base : Node2D
@export var pos : int

func _ready():
	global_position = GetTarget(0)


func GetTarget(newpos):
	print(newpos)
	if newpos >= 0 and newpos < 3:
		var tmp = Base.GetPos(newpos + pos)
		pos = newpos
		return tmp
	return Base.GetPos(pos)
