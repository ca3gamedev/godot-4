extends Node2D

func Update():
	match(%Family.get_item_text(%Family.selected)):
		"European" : $Ani.animation = "europe"
		"Latina"  : $Ani.animation = "Latina"
		"Islamic" : $Ani.animation = "muslim"
		"Russian" : $Ani.animation = "slav"
		"African" : $Ani.animation = "africa"
		"Oceania"  : $Ani.animation = "sea"
		"East Asia"  : $Ani.animation = "east_asia"
		"Hindu"  : $Ani.animation = "Hindu"
		"Sci fi"  : $Ani.animation = "military"
		"Elf"  : $Ani.animation = "military"
		"Demonic" : $Ani.animation = "demon"
		"Pre historic" : pass
		"Canine"  : $Ani.animation = "Dogs"
		"Feline"  : $Ani.animation = "Cats"
		"Furry"  : $Ani.animation = "furry"
		"Monster girls"  : $Ani.animation = "Myth"
		"Feral"  : $Ani.animation = "feral"
		"Main Characters" : $Ani.animation = "main"
	
	$Ani.frame = %Girl.selected
