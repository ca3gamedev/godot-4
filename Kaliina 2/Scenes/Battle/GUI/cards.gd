extends Node2D

@export var ids : Array

func _ready() -> void:
	
	for i in 4:
		var id = randi_range(0, 3)
		ids.append(id)
	
	Update()

func Update():
	for i in 4:
		$Sprites.get_node(str(i)).frame = ids[i]

func GetID():
	var id = ids[0]
	ids.remove_at(0)
	ids.append(randi_range(0, 3))
	Update()
	return id
