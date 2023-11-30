extends Area2D

@export var protectedtimer : float
@export var maxtimer : float
@export var id : int
@export var colorblack : Color
@export var colorwhite : Color
@export var colormiddle : Color
@onready var colortween : Tween


func _process(delta):
	
	if CombatData.Protected:
		protectedtimer += delta
		
		if $"../".DataPath.MyGUI.get_node("Stamina").value >= 100 and CombatData.StaminaStocks < 5:
			$"../".DataPath.MyGUI.get_node("Stamina").value = 0
			CombatData.StaminaStocks += 1
			$"../".DataPath.MyGUI.get_node("StaminaStocks").text = str(CombatData.StaminaStocks)
		
		if $"../".DataPath.MyGUI.get_node("Stamina").value < 100:
			$"../".DataPath.MyGUI.get_node("Stamina").value += delta * 50
	
	if protectedtimer > maxtimer :
		CombatData.Protected = false
		get_parent().KillArea()
		self.queue_free()

func SETID(newid):
	if newid < 0:
		id = 0
		$AreaCircle.modulate = colorblack
	else:
		id = 1
		$AreaCircle.modulate = colorwhite


func _on_body_entered(body):
	if body.is_in_group("ROSA"):
		CombatData.Protected = true
		$Die.start(10)
		colortween = create_tween()
		colortween.tween_property($AreaCircle, "modulate", colormiddle, 10.0)
	
	if body.is_in_group("BALL"):
		if body.hadouken:
			CombatData.Protected = false
			get_parent().KillArea()
			get_parent().Gold()
			self.queue_free()


func _on_body_exited(body):
	
	if body.is_in_group("ROSA"):
		CombatData.Protected = true


func _on_die_timeout():
	CombatData.Protected = false
	get_parent().KillArea()
	self.queue_free()
