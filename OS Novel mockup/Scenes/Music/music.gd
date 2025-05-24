extends Node

func _ready() -> void:
	randomize()
	ChooseSong()

func ChooseSong():
	if randi_range(0, 10) > 5:
		$Song1.play()
	else:
		$Song2.play()

func _on_song_1_finished() -> void:
	ChooseSong()


func _on_song_2_finished() -> void:
	ChooseSong()
