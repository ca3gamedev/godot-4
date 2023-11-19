extends Node

var idle = false


func Check():
	return idle

func Start():
	idle = true
	$Timer.start(randf_range(3, 5))


func _on_timer_timeout():
	idle = false

func Update():
	pass

func Physics():
	pass
