extends Node

func GetButton():
	return %InputBuffer.button

func GetDash():
	var dir = 0
	if GetRightDash():
		dir = 1
	if GetLeftDash():
		dir = -1
	return dir
	
func GetWalk():
	var dir = 0
	if %InputBuffer.arrowbuffer[0].x == 1:
		dir = 1
	if %InputBuffer.arrowbuffer[0].x == -1:
		dir = -1
	return dir

func GetIdle():
	if %InputBuffer.arrowbuffer[0].x == 0:
		return true
	return false

func GetRightDash():
	if len(%InputBuffer.arrowbuffer)-1 <= 2:
		return false
	
	if %InputBuffer.arrowbuffer[0].x == 1:
		if %InputBuffer.arrowbuffer[1].x == 0:
			if %InputBuffer.arrowbuffer[2].x == 1:
				return true
	return false


func GetLeftDash():
	if len(%InputBuffer.arrowbuffer)-1 <= 2:
		return false
	
	if %InputBuffer.arrowbuffer[0].x == -1:
		if %InputBuffer.arrowbuffer[1].x == 0:
			if %InputBuffer.arrowbuffer[2].x == -1:
				return true
	return false
