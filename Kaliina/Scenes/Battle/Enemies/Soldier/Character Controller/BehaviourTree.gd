extends Node

@onready var current = $IDLE

func _process(delta):
	var node = GetChild()
	if node != null:
		current = node
		current.Start()
	
	current.Update()
	current.Physics()

func GetChild():
	var node = null
	for i in get_children():
		var check = i.Check()
		if check:
			node = i
	
	return node
