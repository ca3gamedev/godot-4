extends Node2D

func _ready():
	Variables.GUI = self
	$CanvasLayer/TimeLeft.value = 30

func _physics_process(delta):
	$CanvasLayer/TimeLeft.value -= delta
	
	if $CanvasLayer/TimeLeft.value < 0.1:
		Variables.GameOver()

func HIT():
	$CanvasLayer/TimeLeft.value -= 5

func COIN():
	$CanvasLayer/TimeLeft.value = 30
