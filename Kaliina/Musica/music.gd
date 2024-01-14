extends Node

@export var MaxSongs : int


func _ready():
	pass
	
func StopIntro():
	$Intro.playing = false
	$Timer.start(2)

func StartIntro():
	$Intro.playing = true

func StopMusic():
	$"Songs/0".playing = false
	$"Songs/1".playing = false
	$"Songs/2".playing = false
	$"Songs/3".playing = false
	$"Songs/4".playing = false
	$"Songs/5".playing = false
	$"Songs/6".playing = false
	$"Songs/7".playing = false
	$Intro.playing = false
	$Sounds/Aura/Aura.playing = false

func NextSong():
	StopMusic()
	$Space.start(2)
	
func StartBattleSong():
	var choice =  randi_range(0, MaxSongs * 4)
	var pick = choice / 4
	
	get_node("Songs/" + str(pick)).playing = true

func _on__finished():
	$Timer.start(2)

func PlayBounce():
	var pick = randi_range(0, 4)
	
	var name = "Sounds/Bounce/" + str(pick)
	get_node(name).playing =  true

func PlayAura():
	
	get_node("Sounds/Aura/Aura").playing = true

func WinClap():
	get_node("Sounds/Win/Clap").playing = true

func PlayShoot():
	var pick = randi_range(0, 3)
	var name = "Sounds/Shoot/" + str(pick)
	
	get_node(name).playing =  true


func _on_timer_timeout():
	NextSong()


func _on_space_timeout():
	StartBattleSong()
