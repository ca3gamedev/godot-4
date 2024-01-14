extends CanvasLayer

enum DayTime {none, morning, noon, afternoon, night }
@export var TimeDay : DayTime

func _ready():
	
	$Morning.hide()
	$Noon.hide()
	$Afternoon.hide()
	$Night.hide()
	$AnimationPlayer.play("Start")	
	match(TimeDay):
		DayTime.morning : $Morning.show()
		DayTime.noon : $Noon.show()
		DayTime.afternoon : $Afternoon.show()
		DayTime.night : $Night.show()
