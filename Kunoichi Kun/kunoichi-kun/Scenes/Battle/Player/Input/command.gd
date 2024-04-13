extends Node


func GetArrows():
	return %Buffer.arrows[0]

func GetDash():
	
	if %Buffer.arrows.size() > 2:
		if %Buffer.arrows[0].x == -1 and %Buffer.arrows[1].x == 0 and %Buffer.arrows[2].x == -1:
			return true
		if %Buffer.arrows[0].x == 1 and %Buffer.arrows[1].x == 0 and %Buffer.arrows[2].x == 1:
			return true
	return false
	
