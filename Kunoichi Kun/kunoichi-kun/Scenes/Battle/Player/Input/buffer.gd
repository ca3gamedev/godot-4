extends Node

@export var arrows : Array
@export var delay : float
@export var max_delay : float

func _ready() -> void:
	arrows.append(Vector2i.ZERO)

func _process(delta: float) -> void:
	
	if arrows[0] == Vector2i.ZERO:
		delay += delta
	else:
		delay = 0
		
	if delay > max_delay and arrows.size() > 3:
		arrows = []
		arrows.append(Vector2i.ZERO)


func AddKey(keys):
	
	if arrows[0] != keys:
		arrows.insert(0, keys)
		
		if arrows.size() > 9:
			arrows.remove_at(9)
