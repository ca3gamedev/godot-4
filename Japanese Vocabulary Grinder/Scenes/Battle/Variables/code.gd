extends Node

var example_dict = {}

var kanji = 7
var kana = 8
var english = 9

func _ready():
	import_resources_data()
 
func import_resources_data():
	var file = FileAccess.open("res://Scenes/Battle/Variables/JapCore.txt", FileAccess.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
	file.close()
