extends Node

@onready var arrows = []
@onready var timerbuffer = 0
@onready var button = "none"
@onready var timerbutton = 0
@onready var commandbuffer = "none"
@onready var commandtimer = 0

func _ready():
	arrows.append(Vector2i.ZERO)

func _process(delta):
	
	if timerbuffer > 2 and len(arrows) > 1:
		arrows = []
		arrows.append(Vector2i.ZERO)
	elif timerbuffer <= 2:
		timerbuffer += delta
	
	if timerbutton > 2 and button != "none":
		button = "none"
	else:
		timerbutton += delta
		
	if commandtimer > 1 and commandbuffer != "none":
		commandbuffer = "none"
	else:
		commandtimer += delta

func AddArrow(new_arrow):
	if arrows[0] != new_arrow:
		arrows.insert(0, new_arrow)
		timerbuffer = 0
	
	if len(arrows) > 9:
		arrows.remove_at(9)
	
func AddButton(newbutton):
	
	button = newbutton
	timerbutton = 0
