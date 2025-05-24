extends Node2D

func _ready() -> void:
	HideTabs()
	Variables.Root = self


func HideTabs():
	$OneShot.hide()
	$Story.hide()
	
func ShowTabs(tab):
	match(tab):
		"ONESHOT" : $OneShot.show()
		"NOVEL" : $Story.show()

func ChangeTab(tab):
	HideTabs()
	ShowTabs(tab)
