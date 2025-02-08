extends Node2D

func _ready():
	Variables.GUI = self
	
	$CanvasLayer/Level.text = "LEVEL : " + str(Variables.roguelevelsid)
	Coin()
	
	await get_tree().process_frame
	Variables.keys = get_tree().get_nodes_in_group("KEYS").size()
	Key()
	UpdateHP()

func _process(delta):
	
	$CanvasLayer/FPS.text = "FPS : " + str(Engine.get_frames_per_second())

func HIT():
	UpdateHP()

func Coin():
	$CanvasLayer/coins.text = "COINS : " + str(Variables.coins)

func Key():
	await get_tree().process_frame
	await get_tree().process_frame
	Variables.keys = get_tree().get_nodes_in_group("KEYS").size()
	$CanvasLayer/keys.text = "KEYS LEFT : " + str(Variables.keys)

func UpdateHP():
	$CanvasLayer/HP.value = Variables.HP
