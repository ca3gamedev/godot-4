extends Node


func _ready() -> void:
	
	for i in %Variables.families:
		%Family.add_item(i)
	for i in %Variables.Month:
		%Girl.add_item(i)
	
	await  get_tree().process_frame
	$"../../Face".Update()


func GetFamilyOffset():
	
	var index = []
	for i in len(%Variables.families):
		var id = randi_range(0, 48) % 24
		index.append(id)
	print(index)


func GetOffset():
	var index = []
	for i in %Variables.questions:
		var id = randi_range(0, 48) % 24
		index.append(id)
	print (index)


func _on_family_item_selected(index: int) -> void:
	
	$"../../Manager".UpdateList()
	$"../../Face".Update()


func _on_girl_item_selected(index: int) -> void:
	
	$"../../Manager".UpdateList()
	$"../../Face".Update()
