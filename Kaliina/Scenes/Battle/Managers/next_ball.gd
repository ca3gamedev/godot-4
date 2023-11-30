extends Node2D

@onready var id = []

func _ready():
	Spawn()
	Spawn()
	Spawn()

func GetId():
	var newid = randi_range(0, 2)
	
	return newid
	
func Spawn():
	id.insert(0, GetId())
	
	if len(id) > 4:
		id.remove_at(4)
	
	if len(id) >= 3:
		UpdateGUI()
	
func UpdateGUI():
	
	SetGUI("1", id[0])
	SetGUI("2", id[1])
	SetGUI("3", id[2])
	
func SetGUI(x, pic):
	get_node(x).animation = str(pic)
