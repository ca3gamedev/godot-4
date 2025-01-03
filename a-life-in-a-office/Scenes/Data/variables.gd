extends Node

var dificulty = 0.5

var ending_battle = false
var entering_office = true

var OfficeTranstionPlayer : AnimationPlayer

func ChangeScene(scene):
	
	match(scene):
		"BATTLE BEGIN":
			ending_battle = true
			entering_office = false
			get_tree().change_scene_to_file("res://Scenes/Battle/battle.tscn")
			await get_tree().process_frame
			OfficeTranstionPlayer.play("VerticalLine")
		"BATTLE END" : 
			ending_battle = true
			entering_office = false
			get_tree().change_scene_to_file("res://Scenes/Office/office.tscn")
			await get_tree().process_frame
			if randi_range(0, 4) >= 3:
				OfficeTranstionPlayer.play("StartOffice")
			else:
				OfficeTranstionPlayer.play("StartOfficeNoCamera")
		"OFFICE START" :
			ending_battle = false
			entering_office = true
			get_tree().change_scene_to_file("res://Scenes/Office/office.tscn")
			await get_tree().process_frame
			if randi_range(0, 4) > 3:
				OfficeTranstionPlayer.play("StartOffice")
			else:
				OfficeTranstionPlayer.play("StartOfficeNoCamera")
