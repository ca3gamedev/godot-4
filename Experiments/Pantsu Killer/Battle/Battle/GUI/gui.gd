extends Node2D

@export var exp : int
@export var time_left : float
@export var level : int

func _ready():
	level = 1
	$CanvasLayer/Level.text = str(level)
	$CanvasLayer/EXP.value = 0
	$CanvasLayer/TIMELEFT.value = 100
	$CanvasLayer/TIMELEFT.max_value = 100
	$CanvasLayer/ScoreLabel.text = str(Variables.score)
	Variables.GUI = self

func HIT():
	
	exp += 1
	
	if exp > 9:
		exp = 0
		level += 1
	
	$CanvasLayer/EXP.value = exp
	$CanvasLayer/Level.text = str(level)
	time_left = 100.0
	$CanvasLayer/TIMELEFT.value = time_left

func _process(delta):
	
	time_left -= delta * level
	$CanvasLayer/TIMELEFT.value = time_left
	
	if time_left < 0:
		Variables.ChangeScene("04")

func KILL():
	Variables.score += 1
	$CanvasLayer/ScoreLabel.text = str(Variables.score)
	
