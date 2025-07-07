extends Node

@export var Player : CharacterBody2D
@export var CoinManager : Node2D
@export var BulletsManager : Node2D
@export var Stamina : float

@export var HP : int = 100

@export var level : int
@export var Words : Node2D

@export var LockMira : Sprite2D

@export var correct_words : int
@export var wrong_words : int
@export var review_words : int

@export var CurrentFile : int

var Levels_score


func _ready():
	print("User data found at ", OS.get_user_data_dir())


func Save():
	if Levels_score.is_empty():
		print("Nothing to save. Levels_score is empty.")
		return

	var file_name = "user://goi_levels_score_" + str(CurrentFile) + ".json"
	var save_file = FileAccess.open(file_name, FileAccess.WRITE)
	if not save_file:
		print("Failed to open file for saving.")
		return

	var json_string = JSON.stringify(Levels_score, "\t")
	save_file.store_string(json_string)
	save_file.close()

func LoadSave(file):
	var file_name = "user://goi_levels_score_" + str(file) + ".json"
	
	if not FileAccess.file_exists(file_name):
		print("Not save file")
		return
	
	var save_file = FileAccess.open(file_name, FileAccess.READ)
	var json_string = save_file.get_as_text()
	save_file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		print("JSON Parse Error: ", json.get_error_message(), " at line ", json.get_error_line())
		return
	
	var loaded_data = json.data
	if typeof(loaded_data) != TYPE_ARRAY:
		print("Expected an array but got: ", typeof(loaded_data))
		return
	
	Levels_score = loaded_data
	

func SaveEmpty(file):
	var file_name = "user://goi_levels_score_" + str(file) + ".json"
	
	var level = {
		"max_word" : 0,
		"correct" : 0,
		"wrong" : 0
	}
	
	var save_file = FileAccess.open(file_name, FileAccess.WRITE)
	
	var levels = []
	for i in 60:
		levels.append(level.duplicate(true))
	
	var json_string = JSON.stringify(levels, "\t")
	save_file.store_line(json_string)

	save_file.close()



func ChangeScene(scene):
	match(scene):
		"New Game" : GotoLevel.call_deferred($Paths.NewGame)
		"Battle" : GotoLevel.call_deferred($Paths.Battle)
		"Levels" : GotoLevel.call_deferred($Paths.LevelSelection)
		"Title" : GotoLevel.call_deferred($Paths.Title)
		"Tutorial" : GotoLevel.call_deferred($Paths.Tutorial)
		"Options" : GotoLevel.call_deferred($Paths.Options)

func GotoLevel(new_level):
	get_tree().change_scene_to_file(new_level)
	
func EndBattle():
	HP = 100
	Stamina = 100
	if Levels_score[level].max_word <= review_words:
		Levels_score[level].max_word = review_words
		Levels_score[level].wrong = wrong_words
	if Levels_score[level].correct < correct_words:
		Levels_score[level].correct = correct_words
	
	if Levels_score[level].max_word == 0 and Levels_score[level].wrong == 0 and Levels_score[level].correct == 0:
		Levels_score[level].max_word = review_words
		Levels_score[level].wrong = wrong_words
		Levels_score[level].correct = correct_words
		
	Save()
	Variables.ChangeScene("Levels")


func CheckSaveExist(file):
	var file_name = "user://goi_levels_score_" + str(file) + ".json"
	if not FileAccess.file_exists(file_name):
		return false
	return true
