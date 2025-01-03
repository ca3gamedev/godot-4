extends Node2D

var bosshp = 500
var hp = 10
var deadcount = 0
var nodamage = false
var critical = 50

func _ready():
	$CanvasLayer/deads.text = str(Variables.deads)
	Variables.GUI = self
	var damage = Variables.score * 8
	bosshp -= damage
	$CanvasLayer/BOSSHP.max_value = bosshp
	$CanvasLayer/BOSSHP.value = bosshp
	$CanvasLayer/HPboss.text = str(bosshp)
	$CanvasLayer/HPBAR.max_value = 10
	$CanvasLayer/HPBAR.value = 10
	$CanvasLayer/Critical.hide()

func _process(delta):
	$CanvasLayer/BOSSHP.value = bosshp
	$CanvasLayer/HPboss.text = str(bosshp)

func HIT(hit):
	
	if hit == 50:
		bosshp -= critical
		critical = 0
	else:
		bosshp -= 1
	
	var critical = randi_range(0, 6)
	
	if critical == 3:
		bosshp -= 10
		$CanvasLayer/Critical.show()
		$Critical.start(1)
	
	Variables.BOSS.HIT()
	
	if bosshp < 1:
		Variables.ChangeScene("VICTORY")

func Damage():
	hp -= 1
	$CanvasLayer/HPBAR.value = hp
	
	if hp < 1:
		deadcount += 1
		hp = 10
		HIT(critical)
		Variables.deads += 1
		$CanvasLayer/deads.text = str(Variables.deads)
		$CanvasLayer/HPBAR.max_value = 10
		$CanvasLayer/HPBAR.value = 10
	


func _on_critical_timeout():
	$CanvasLayer/Critical.hide()


func _on_nodamage_timeout():
	nodamage = true


func _on_damage_timeout():
	critical = 50
