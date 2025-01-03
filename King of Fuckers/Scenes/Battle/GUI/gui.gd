extends Node2D

func _ready():
	Variables.GUI = self
	$GUI/AthenaPantsu.hide()
	$GUI/LeonaPantsu.hide()
	$GUI/Kensou.hide()

func HIT(girl):
	match(girl):
		"athena" : 
			$GUI/AthenaPantsu.show()
			$Girl1.start(0.5)
		"leona" :
			$GUI/LeonaPantsu.show()
			$Girl2.start(0.5)
		"kensou" :
			$GUI/Kensou.show()
			$Kensou.start(0.5)

func _on_girl_1_timeout():
	$GUI/AthenaPantsu.hide()

func _on_girl_2_timeout():
	$GUI/LeonaPantsu.hide()

func _on_kensou_timeout():
	$GUI/Kensou.hide()
