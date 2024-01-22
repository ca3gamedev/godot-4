extends Node2D

func GetPos(pos):
	if pos < 0:
		return $"Bases/0".global_position
	if pos > 3:
		return $"Bases/3".global_position
	
	var newpos = "Bases/" + str(pos)
	return get_node(newpos).global_position
