extends Node2D

var current : int
@export var selector : PackedScene
@export var y_off : float
@export var speed : int

func _ready():
	for i in 60:
		var tmp = selector.instantiate()
		tmp.name = str(i)
		tmp.position.y = i * y_off
		tmp.get_node("LevelName").text = "Level : " + str(i)
		var data = Variables.Levels_score[i]
		tmp.get_node("Words").text = "Words left : " + str(int(data.max_word))
		tmp.get_node("Correct").text = "Correct : " + str(int(data.correct))
		tmp.get_node("Wrong").text = "Wrong : " + str(int(data.wrong))
		if Variables.Levels_score[i].max_word == 0 and Variables.Levels_score[i].wrong == 0 and Variables.Levels_score[i].correct == 0:
			tmp.get_node("Words").text = "Not Done Yet"
			tmp.get_node("Correct").text = ""
			tmp.get_node("Wrong").text = ""
		add_child(tmp)
		
	
	
	Clear()


func Clear():
	for i in 60:
		get_node(str(i)).UNSELECT()
	
	get_node(str(current)).SELECT()


func _process(delta):
	
	if current < 0:
		current = 59
	if current > 59:
		current = 0
	
	if  %Camera.position.distance_to($LevelSelection.position) > 200:
		speed = 300
	else:
		speed = 4
	
	$LevelSelection.position.y = lerp($LevelSelection.position.y, get_node(str(current)).position.y, delta * speed)
	%Camera.position = lerp(%Camera.position, get_node(str(current)).position, delta * speed)
	%Back.global_position = %Camera.global_position
	
	if Input.is_action_just_released("DOWN"):
		current += 1
		$Clear.start(0.2)
		
	if Input.is_action_just_released("UP"):
		current -= 1
		$Clear.start(0.2)
	
	if Input.is_action_just_released("A"):
		Variables.level = current
		Variables.get_node("Code").ResetList()
		Variables.ChangeScene("Battle")


func _on_clear_timeout():
	Clear()
