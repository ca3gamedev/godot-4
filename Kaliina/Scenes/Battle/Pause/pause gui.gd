extends Node2D

@export var fullscreen : bool


func _ready():
	%saved.hide()
	

func _on_min_music_button_up():
	%MusicVolume.value -= 3
	AudioServer.set_bus_volume_db(1, %MusicVolume.value)


func _on_max_music_button_up():
	%MusicVolume.value += 3
	AudioServer.set_bus_volume_db(1, %MusicVolume.value)


func _on_music_mute_button_up():
	AudioServer.set_bus_mute(1, %"Music Mute".button_pressed)


func _on_min_sfx_button_up():
	%SFXVolume.value -= 3
	AudioServer.set_bus_volume_db(2, %SFXVolume.value)


func _on_max_sfx_button_up():
	%SFXVolume.value += 3
	AudioServer.set_bus_volume_db(2, %SFXVolume.value)


func _on_sfx_mute_button_up():
	AudioServer.set_bus_mute(2, %"SFX Mute".button_pressed)


func _on_fullscreen_button_up():
	fullscreen = !fullscreen
	
	if fullscreen :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_save_button_up():
	SaveData()
	

func SaveData():
	%saved.show()
	%savedtimer.start(1)
	var config = ConfigFile.new()
	
	config.set_value("Volume", "Music Volume", %MusicVolume.value)
	config.set_value("Volume", "SFX Volume", %SFXVolume.value)
	config.set_value("Mute", "Music Mute", %"Music Mute".button_pressed)
	config.set_value("Mute", "SFX Mute", %"SFX Mute".button_pressed)
	config.set_value("FullScreen", "FullScreen", fullscreen)
	config.set_value("Input arrows", "UP", InputMap.action_get_events("UP")[0])
	config.set_value("Input arrows", "DOWN", InputMap.action_get_events("DOWN")[0])
	config.set_value("Input arrows", "LEFT", InputMap.action_get_events("LEFT")[0])
	config.set_value("Input arrows", "RIGHT", InputMap.action_get_events("RIGHT")[0])
	config.set_value("Input buttons", "SHOOT", InputMap.action_get_events("SHOOT")[0])
	config.set_value("Input buttons", "CHANGE", InputMap.action_get_events("UPGUN")[0])
	
	config.save("user://Options.cfg")
	

func LoadData():
	var config = ConfigFile.new()
	var err = config.load("user://Options.cfg")
	
	if err != OK:
		return
	
	for data in config.get_sections():
		%MusicVolume.value = config.get_value("Volume", "Music Volume")
		AudioServer.set_bus_volume_db(1, %MusicVolume.value)
		%SFXVolume.value = config.get_value("Volume", "SFX Volume")
		AudioServer.set_bus_volume_db(2, %SFXVolume.value)
		%"Music Mute".button_pressed = config.get_value("Mute", "Music Mute")
		AudioServer.set_bus_mute(1, %"Music Mute".button_pressed)
		%"SFX Mute".button_pressed = config.get_value("Mute", "SFX Mute")
		AudioServer.set_bus_mute(2, %"SFX Mute".button_pressed)
		fullscreen = config.get_value("FullScreen", "FullScreen")
		
		if fullscreen :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
		InputMap.action_erase_events("UP")
		InputMap.action_add_event("UP", config.get_value("Input arrows", "UP"))
		InputMap.action_erase_events("LEFT")
		InputMap.action_add_event("LEFT", config.get_value("Input arrows", "LEFT"))
		InputMap.action_erase_events("RIGHT")
		InputMap.action_add_event("RIGHT", config.get_value("Input arrows", "RIGHT"))
		InputMap.action_erase_events("DOWN")
		InputMap.action_add_event("DOWN", config.get_value("Input arrows", "DOWN"))
		InputMap.action_erase_events("SHOOT")
		InputMap.action_add_event("SHOOT", config.get_value("Input buttons", "SHOOT"))
		InputMap.action_erase_events("UPGUN")
		InputMap.action_add_event("UPGUN", config.get_value("Input buttons", "CHANGE"))
		
		
		%Up.text = OS.get_keycode_string(config.get_value("Input arrows", "UP").get_physical_keycode_with_modifiers())
		%Left.text = OS.get_keycode_string(config.get_value("Input arrows", "LEFT").get_physical_keycode_with_modifiers())
		%Right.text = OS.get_keycode_string(config.get_value("Input arrows", "RIGHT").get_physical_keycode_with_modifiers())
		%Down.text = OS.get_keycode_string(config.get_value("Input arrows", "DOWN").get_physical_keycode_with_modifiers())
		%Shoot.text = OS.get_keycode_string(config.get_value("Input buttons", "SHOOT").get_physical_keycode_with_modifiers())
		%Change.text = OS.get_keycode_string(config.get_value("Input buttons", "CHANGE").get_physical_keycode_with_modifiers())


func _on_savedtimer_timeout():
	%saved.hide()


func _on_load_button_up():
	LoadData()
