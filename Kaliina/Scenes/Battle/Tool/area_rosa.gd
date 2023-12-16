extends Area2D

@export var protectedtimer : float
@export var maxtimer : float
@export var colorwhite : Color
@export var colormiddle : Color
@onready var colortween : Tween
@onready var starttimer = false


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
		
	if starttimer:
		var timeleft = 1 - ($Die.time_left / 10)
		var old_color = Color(1, 1, 1, $Ring.modulate.a - timeleft)
		$Ring.modulate = old_color
		old_color = Color(1, 1, 1, $Ring2.modulate.a - timeleft)
		$Ring2.modulate = old_color

func SETID():
	$AreaCircle.modulate = colorwhite


func _on_body_entered(body):
	if body.is_in_group("ROSA"):
		CombatData.Protected = true
		$Die.start(10)
		colortween = create_tween()
		colortween.tween_property($AreaCircle, "modulate", colormiddle, 10.0)
		$Active.play("Active")
		starttimer = true
	
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
