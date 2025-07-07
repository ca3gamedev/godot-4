extends Node2D

var waiting_for_input = false
var action_to_rebind = "jump"

func _on_music_value_changed(value):
	%MusicLog.text = str(int(value))


func _on_sfx_value_changed(value):
	%SFXLog.text = str(int(value))


func _on_return_pressed():
	Variables.ChangeScene("Title")


func _on_rebind_timeout():
	pass # Replace with function body.
