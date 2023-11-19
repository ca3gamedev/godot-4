extends Node2D

func _ready():
	%Continue.hide()
	%GameOver.hide()

func _process(delta):
	
	var target = GetTarget()
	$monster.global_position = target
	
	%TIMELEFT.value -= delta
	
	if %GameOver.visible == false and  %TIMELEFT.value < 1:
		%GameOver.show()

func GetTarget():
	
	var pos = $Pos1.global_position
	
	match($monster.id):
		1 : pos = $Pos1.global_position
		2 : pos = $Pos2.global_position
		3 : pos = $Pos3.global_position
	
	return pos

func KICK(id):
	if id == $monster.id :
		$monster.KICK()

func EnemyKilled():
	%Continue.show()
	$monster.hide()
