extends Node

@export var Pacifica : bool

@export var HP : int
@export var MaxHP : int

@export var Battle : PackedScene
@export var IsBattleActive : bool

func HIT(damage):
	HP -= damage
	DataPath.GUI.UpdateHP()
	
	if HP < 1:
		CombatData.GameOver()

func StartBattle():
	
	if not IsBattleActive:
		$FadeIn.start(1)
		$FadeOut.start(2)
		Transition.FadeIn()
		
		DataPath.DungeonRoot.process_mode = Node.PROCESS_MODE_DISABLED
		IsBattleActive = true
		
func StartBattleFadeIn():
	DataPath.DungeonRoot.hide()
	DataPath.DungeonRoot.set_physics_process(false)
	
	var tmp = Battle.instantiate()
	tmp.process_mode = Node.PROCESS_MODE_DISABLED
	get_tree().get_root().add_child(tmp)
	$StartBattleTimer.start(1)


func EndBattle():
	IsBattleActive = false
	Transition.FadeOut()
	DataPath.DungeonRoot.show()
	DataPath.BattleRoot.queue_free()
	DataPath.DungeonRoot.process_mode = Node.PROCESS_MODE_INHERIT
	DataPath.DungeonRoot.set_physics_process(true)
	DataPath.DungeonGUI.set_process(true)
	DataPath.DungeonGUI.ResetWalk()
	DataPath.DungeonRoot.CameraEnable()

func GameOver():
	IsBattleActive = false
	DataPath.BattleRoot.queue_free()
	get_tree().change_scene_to_file("res://Scenes/Menues/game_over.tscn")


func _on_fade_out_timeout() -> void:
	Transition.FadeOut()


func _on_fade_in_timeout() -> void:
	StartBattleFadeIn()


func _on_start_battle_timer_timeout() -> void:
	DataPath.BattleRoot.process_mode = Node.PROCESS_MODE_INHERIT
