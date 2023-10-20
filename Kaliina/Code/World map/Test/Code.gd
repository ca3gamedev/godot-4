extends Node

@export var stage : int
@export var idle : bool

func _process(delta):
	
	%TitleLevel.text = ""
	
	if %Path.progress_ratio > 0.9 or %Path.progress_ratio < 0.1:
		idle = true
	
	if Input.is_action_just_released("LEFT") and %Path.progress_ratio > 0.9 and idle:
		stage = 0
		idle = false
	
	if Input.is_action_just_released("RIGHT") and %Path.progress_ratio < 0.1 and idle:
		stage = 1
		idle = false
		
	%Path.progress_ratio = lerp(%Path.progress_ratio, float(stage), delta)
	

	if idle :
		match(stage):
			0: %TitleLevel.text = "House Dialog"
			1: %TitleLevel.text = "First Battle"
	
