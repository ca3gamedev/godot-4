extends Node

@export var weaponactive : bool

@onready var delaybouldertimer = 0

func _process(delta):
	
	var button = CheckInput()
	
	if Variables.get_node("CombatVars").boulderforce > 0:
		Variables.get_node("CombatVars").boulderforcetimer += delta
	
	if delaybouldertimer >= 1:
		delaybouldertimer += delta
	if delaybouldertimer > 2:
		delaybouldertimer = 0
		Variables.get_node("DataPaths").myGUI.get_node("CanvasLayer/Boulder01").value = Variables.get_node("CombatVars").boulderforce
		Variables.get_node("DataPaths").myGUI.get_node("CanvasLayer/Boulder01").set("theme_override_colors/font_color", Color.WHITE)
	
	if Variables.get_node("CombatVars").boulderforcetimer > 2 and Variables.get_node("CombatVars").boulderforce > 0:
		Variables.get_node("DataPaths").myGUI.get_node("CanvasLayer/Boulder01").set("theme_override_colors/font_color", Color.RED)
		SpawnBoulder()
		Variables.get_node("CombatVars").boulderforcetimer = 0
		Variables.get_node("CombatVars").boulderforce = 0
		delaybouldertimer = 1
	
	if weaponactive and button == "B r":
		Variables.get_node("CombatVars").boulderforce += 1
		Variables.get_node("CombatVars").boulderforcetimer = 0
		Variables.get_node("DataPaths").myGUI.get_node("CanvasLayer/Boulder01").value = Variables.get_node("CombatVars").boulderforce


func CheckInput():
	var button = "none"
	
	if Input.is_action_just_released("B"):
		button = "B r"
	return button

func SpawnBoulder():
	Variables.get_node("DataPaths").OnagerManager.SpawnBoulder()
