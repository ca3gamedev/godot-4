extends Node2D

var correct_answer : int
var choice : int
var idle = false
var current : CharacterBody2D

func _ready():
	%PlayerHP.value = Variables.HP
	%EnemyHP.value = 0
	await get_tree().process_frame
	Variables.Words = self
	Variables.Words.Clear()
	%Rectangle.hide()
	ResetStaminaColor()

func UpdateHP():
	%PlayerHP.value = Variables.HP

func GetNewerWord(new_target):
	if new_target == null:
		return
	current = new_target
	%EnemyHP.value = current.HP
	var first = Variables.get_node("Code").word_list[0]
	Variables.get_node("Code").word_list.remove_at(0)
	Variables.get_node("Code").word_list.append(first)
	var kana = Variables.get_node("Code").word_list[0][2]
	var kanji = Variables.get_node("Code").word_list[0][1]
	%JapaneseWord.text = str(kanji)
	%JapaneseWordKana.text = str(kana)
	
	correct_answer = randi_range(0, 3)
	
	var id = randi_range(0, len(Variables.get_node("Code").word_list)-1)
	%AWord.text = Variables.get_node("Code").word_list[id][0]
	id = randi_range(0, len(Variables.get_node("Code").word_list)-1)
	%BWord.text = Variables.get_node("Code").word_list[id][0]
	id = randi_range(0, len(Variables.get_node("Code").word_list)-1)
	%CWord.text = Variables.get_node("Code").word_list[id][0]
	id = randi_range(0, len(Variables.get_node("Code").word_list)-1)
	%DWord.text = Variables.get_node("Code").word_list[id][0]
	
	match (correct_answer):
		0 : 
			%AWord.text = Variables.get_node("Code").word_list[0][0]
		1 : 
			%BWord.text = Variables.get_node("Code").word_list[0][0]
		2 : 
			%CWord.text = Variables.get_node("Code").word_list[0][0]
		3 : 
			%DWord.text = Variables.get_node("Code").word_list[0][0]
	
	if Variables.review_words < 1:
		Variables.EndBattle()

func Clear():
	%JapaneseWord.text = "Waiting"
	%JapaneseWordKana.text = "Waiting"
	%AWord.text = "..."
	%BWord.text = "..."
	%CWord.text = "..."
	%DWord.text = "..."
	%Result.text = "Waiting..."
	%Result.modulate = Color.WHITE
	%EnemyHP.value = 0
	%Rectangle.hide()

func _process(delta):
	if not idle and Variables.Player.near:	
		var key = -999
		if Input.is_action_just_released("A"):
			choice = 0
			key = 0
		if Input.is_action_just_released("B"):
			choice = 1
			key = 1
		if Input.is_action_just_released("C"):
			choice = 2
			key = 2
		if Input.is_action_just_released("D"):
			choice = 3
			key = 3
		
		if key != -999:
			idle = true
			$Timer.start(0.3)

func SUCCESS():
	if current == null:
		return
	
	var damage = randi_range(3, 30)
	current.HP -= damage
	%EnemyHP.value = current.HP
	
	if current.HP < 0:
		Variables.LockMira.Remove(current)
		KILL()
		current.queue_free()
	else:
		var id = randi_range(0, 2)
		if id == 0:
			%Result.text = "CORRECT"
		elif id == 1:
			%Result.text = "Good"
		else:
			%Result.text = "Great!!!"
		%Result.modulate = Color.GREEN
	
func MISTASKE():
	var id = randi_range(0, 2)
	if id == 0:
		%Result.text = "WRONG"
	elif id == 1:
		%Result.text = "Bad"
	else:
		%Result.text = "Not good!!!"
	%Result.modulate = Color.RED


func _on_timer_timeout():
	if choice == correct_answer:
		SUCCESS()
		Variables.correct_words += 1
		%CorrectWords.text = str(Variables.correct_words)
		%Rectangle.modulate = Color.WHITE
	else:
		MISTASKE()
		Variables.wrong_words += 1
		%WrongWords.text = str(Variables.wrong_words)
		%Rectangle.modulate = Color.RED
	$Reset.start(0.5)
	RectangleShow()

func KILL():
	Clear()


func _on_reset_timeout():
	if current != null:
		Variables.review_words -= 1
		%ReviewWords.text = str(Variables.review_words)
		GetNewerWord(current)
	%Result.text = "..."
	%Result.modulate = Color.WHITE
	%Rectangle.hide()
	idle = false

func RectangleShow():
	match(correct_answer):
		0: %Rectangle.position = Vector2(903, 411)
		1: %Rectangle.position = Vector2(903, 468)
		2: %Rectangle.position = Vector2(903, 522)
		3: %Rectangle.position = Vector2(903, 579)
	%Rectangle.show()

func UpdateStamina():
	%Stamina.value = Variables.Stamina

func StaminaChargeColor():
	var fill = %Stamina.get_theme_stylebox("fill")
	fill.bg_color = Color.RED

func ResetStaminaColor():
	var fill = %Stamina.get_theme_stylebox("fill")
	fill.bg_color = Color8(44, 172, 185, 255)
