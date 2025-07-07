extends Node2D

func _ready():
	Variables.BulletsManager =  self
	Variables.BulletsManager.process_mode = Node.PROCESS_MODE_DISABLED
