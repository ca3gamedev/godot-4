extends Node

@export var current : Node
@export var Tired : bool


func _process(delta):
	
	if not Tired:
		current.Transition()
		current.Update(delta)
		if Variables.Stamina < 1:
			Tired = true
			$"../".Tired = Tired
			Variables.BulletsManager.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		Variables.Stamina += delta * 20
		Variables.Stamina = clampf(Variables.Stamina, 0.0, 100.0)
		Variables.Words.StaminaChargeColor()
		Variables.Words.UpdateStamina()
		if Variables.Stamina >= 100.0:
			$"../".Tired = Tired
			Tired = false
			Variables.Words.ResetStaminaColor()
			Variables.Words.UpdateStamina()
			Variables.BulletsManager.process_mode = Node.PROCESS_MODE_DISABLED
			

func _physics_process(delta):
	
	if not Tired:
		current.Physics(delta)
