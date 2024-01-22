extends Node

func GetText(id):
	match (id) :
		1 : return "Wow, I've never imagined"
		2 : return "Yeah"
		3: return "It took a while to reach here"
		4: return "Yeah"
		5: return "Oh, well, It's time to go to the farm"
		6: return "Yeah, maybe we can help"

func GetPicture(id):
	if id == 1 or id == 3 or id == 5:
		return "Pacifica"
	else:
		return "Rosa"
