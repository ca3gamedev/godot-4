extends Node2D

func _ready():
	ChangeType(randi_range(0, 3))

func ChangeType (id):
	$Icon.frame = id
	
	match(id):
		0 : $Label.text = "Circle Message (UNREAD) \n Press A"
		1 : $Label.text = "Cross Message (UNREAD) \n Press B"
		2 : $Label.text = "Square Message (UNREAD) \n Press C"
		3 : $Label.text = "Triangle Message (UNREAD) \n Press D"
