extends Node

@onready var arrowbuffer = []
@onready var timer = 0
@onready var buttonbuffer = "none"
@onready var timerbutton = 0


func _process(delta):
	
	timer += delta
	timerbutton += delta
	
	if arrowbuffer.size() > 0 and timer > 0.5:
		arrowbuffer = []


func ClearButtons():
	buttonbuffer = "none"


func AddArrow(arrow):
	if len(arrowbuffer) > 0 and arrow == arrowbuffer[0]:
		return
	timer = 0
	arrowbuffer.insert(0, arrow)
	if arrowbuffer.size() > 9:
		arrowbuffer.remove_at(len(arrowbuffer)-1)

func AddButton(button):
	timer = 0
	buttonbuffer = button
