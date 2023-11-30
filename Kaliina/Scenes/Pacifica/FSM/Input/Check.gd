extends Node

func GetWalk():
	
	var walk = Vector2i.ZERO
	if len (%Buffer.arrows) > 0:
		walk = %Buffer.arrows[0]
	
	return walk

func GetDash():
	var dash = Vector2i.ZERO
	
	if len (%Buffer.arrows) < 4:
		return dash
	
	
	if %Buffer.arrows[0].x == -1 and %Buffer.arrows[1].x == 0 and %Buffer.arrows[2].x == -1:
		dash.x = -1
	if %Buffer.arrows[0].x == 1 and %Buffer.arrows[1].x == 0 and %Buffer.arrows[2].x == 1:
		dash.x = 1
	if %Buffer.arrows[0].y == -1 and %Buffer.arrows[1].y == 0 and %Buffer.arrows[2].y == -1:
		dash.y = -1
	if %Buffer.arrows[0].y == 1 and %Buffer.arrows[1].y == 0 and %Buffer.arrows[2].y == 1:
		dash.y = 1
	
	return dash

func GetButton():
	return %Buffer.button

func QCB():
	var qcb = 0
	
	if len(%Buffer.arrows) < 3:
		return qcb
	
	if %Buffer.arrows[0].x == -1 and %Buffer.arrows[2].y == 1:
		qcb = -1
	if %Buffer.arrows[0].x == 1 and %Buffer.arrows[2].y == 1:
		qcb = 1
	
	return qcb

func _process(delta):
	
	var qcb = QCB()
	if qcb != 0:
		%Buffer.commandtimer = 0
		if qcb == -1:
			%Buffer.commandbuffer = "QCB"
		if qcb == 1:
			%Buffer.commandbuffer = "QCF"
			
func GetCommand():
	return %Buffer.commandbuffer
