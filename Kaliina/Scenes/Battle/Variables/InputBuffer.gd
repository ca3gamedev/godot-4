extends Node

var arrowbuffer = []
var arrowbuffertimer = 0
@export var maxarrowtimer : float
var button = "none"

func _ready():
	arrowbuffer.append(Vector3i.ZERO)

func _process(delta):
	
	
	
	if arrowbuffertimer <= maxarrowtimer:
		arrowbuffertimer += delta
	
	if arrowbuffertimer > maxarrowtimer and len(arrowbuffer)-1 > 0:
		if arrowbuffer[0].x == 0:
			arrowbuffer = []
			arrowbuffer.append(Vector3i.ZERO)

func AddInputArrow(keys):
	if keys != arrowbuffer[0]:
		arrowbuffer.insert(0, keys)
		arrowbuffertimer = 0
	if len(arrowbuffer)-1 > 9:
		arrowbuffer.remove_at(len(arrowbuffer)-1)

func AddButton(keys):
	button = keys
