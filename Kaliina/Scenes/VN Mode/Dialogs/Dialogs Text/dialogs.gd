extends Node

func GetText(world, dialog, id):
	var dialogname = world + "/" + dialog
	print(get_node(dialogname).GetText(id))
	
	return get_node(dialogname).GetText(id)

func GetPicture(world, dialog, id):
	var dialogname = world + "/" + dialog
	
	return get_node(dialogname).GetPicture(id)
