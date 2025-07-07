extends Node

var example_dict = {}

var word_list = []

var kanji = 7
var kana = 8
var english = 9

func _ready():
	import_resources_data()
	
	ResetList()
 
func import_resources_data():
	var file = FileAccess.open("res://Scenes/Battle/Variables/JapCore.txt", FileAccess.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
	file.close()

func ResetList():
	word_list.clear()
	var level = $"../".level * 100
	for i in 100:
		if level + i != 0:
			var raw_word = example_dict[level + i]
			var word = [raw_word[english], raw_word[kanji], raw_word[kana]]
			word_list.append(word)
	
	word_list.shuffle()
	
	Variables.review_words = word_list.size()
