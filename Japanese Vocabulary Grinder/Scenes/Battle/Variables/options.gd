extends Node


var options = {
	"Up" : "up",
	"Down" : "down",
	"Left" : "left",
	"Right" : "right",
	"Fullscreen" : false,
	"Music" : 100,
	"SFX" : 100,
	"A" : "a",
	"B" : "b",
	"C" : "c",
	"D" : "d" 
}

var game_options

func _ready():
	game_options = options.duplicate(true)
	LoadSave()
	

func SAVEEMPTY():

	var file_name = "user://goi_grinder_options.json"
	
	var save_file = FileAccess.open(file_name, FileAccess.WRITE)
	var json_string = JSON.stringify(game_options, "\t")
	save_file.store_line(json_string)

	save_file.close()


func LoadSave():
	var file_name = "user://goi_grinder_options.json"
	
	if not FileAccess.file_exists(file_name):
		SAVEEMPTY()
	
	var save_file = FileAccess.open(file_name, FileAccess.READ)
	var json_string = save_file.get_as_text()
	save_file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		print("JSON Parse Error: ", json.get_error_message(), " at line ", json.get_error_line())
		return
	
	var loaded_data = json.data
	
	game_options = loaded_data
	
