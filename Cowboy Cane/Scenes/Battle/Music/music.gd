extends Node

func Play(song):
	
	match (song):
		"Battle01" : $"Battle Theme01".play()

func Stop():
	$"Battle Theme01".stop()
