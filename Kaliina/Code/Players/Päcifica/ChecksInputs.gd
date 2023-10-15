extends Node

func GetInput():
	var dir = Vector3i.ZERO
	var tmp
	
	tmp = CheckWalk()
	if tmp != Vector2i.ZERO:
		dir.y = tmp.x
		dir.z = tmp.y
		dir.x = 1
	
	tmp = CheckDash()
	if tmp != Vector2i.ZERO:
		dir.y = tmp.x
		dir.z = tmp.y
		dir.x = 2
	
	return dir

func GetButtons():
	return %Array.buttonbuffer



func CheckWalk():
	var dir = Vector2i.ZERO
	if len(%Array.arrowbuffer) > 0:
		if %Array.arrowbuffer[0].x == -1:
			dir.x = -1
		if %Array.arrowbuffer[0].x == 1:
			dir.x = 1
		if %Array.arrowbuffer[0].y == -1:
			dir.y = -1
		if %Array.arrowbuffer[0].y == 1:
			dir.y = 1
	return dir

func CheckDash():
	var dir = Vector2i.ZERO
	if len(%Array.arrowbuffer) > 3:
		if %Array.arrowbuffer[0].x == -1 and %Array.arrowbuffer[1].x == -2 and %Array.arrowbuffer[2].x == -1:
			dir.x = -1
		if %Array.arrowbuffer[0].x == 1 and %Array.arrowbuffer[1].x == 2 and %Array.arrowbuffer[2].x == 1:
			dir.x = 1
		if %Array.arrowbuffer[0].y == -1 and %Array.arrowbuffer[1].y == -2 and %Array.arrowbuffer[2].y == -1:
			dir.y = -1
		if %Array.arrowbuffer[0].y == 1 and %Array.arrowbuffer[1].y == 2 and %Array.arrowbuffer[2].y == 1:
			dir.y = 1
	return dir
