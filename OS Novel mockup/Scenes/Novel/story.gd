extends Node2D

@export var current_chapter : int = 1
@export var current_page : int = 1

func _ready() -> void:
	await  get_tree().process_frame
	UpdateMangasLabels()
	$page.text = str(current_page)
	HidePages()
	ShowCurrent()
	ChangeColor()

func _on_buy_pressed() -> void:
	
	if Variables.coins > 10 and Variables.max_novel < 3:
		Variables.coins -= 10
		Variables.max_novel += 1
		UpdateMangasLabels()

func UpdateMangasLabels():
	for i in $Chapters.get_child_count():
		if i < Variables.max_novel:
			$Chapters.get_node(str(i+1)).set("theme_override_colors/font_color",Color.WHITE)
		else:
			$Chapters.get_node(str(i+1)).set("theme_override_colors/font_color",Color.DARK_BLUE)
	Menue.UpdateCoins()
	$Chapters.get_node(str(current_chapter)).set("theme_override_colors/font_color",Color.ORANGE)


func _on_chapter_left_pressed() -> void:
	if current_chapter > 1 :
		current_chapter -= 1
		current_page = 1
		$page.text = str(current_page)
		HidePages()
		UpdateMangasLabels()
		ShowCurrent()
		ChangeColor()

func _on_chapter_right_pressed() -> void:
	if current_chapter < 4 and current_chapter < Variables.max_novel:
		current_chapter += 1
		current_page = 1
		$page.text = str(current_page)
		HidePages()
		UpdateMangasLabels()
		ShowCurrent()
		ChangeColor()


func _on_page_left_pressed() -> void:
	if current_page > 1:
		current_page -= 1
		$page.text = str(current_page)
		MovePageRight(current_page)


func _on_page_right_pressed() -> void:
	if current_page < 5:
		current_page += 1
		$page.text = str(current_page)
		MovePageLeft(current_page-1)

func MovePageLeft(previous):
	HidePages()
	ShowCurrent()

func MovePageRight(next):
	HidePages()
	ShowCurrent()

func ShowCurrent():
	$Pages.get_node(str(current_page)).show()

func HidePages():
	for i in $Pages.get_children():
		i.hide()

func ChangeColor():
	var color = Color8(255 / current_chapter, 255 / current_chapter, 255 / current_chapter, 255 )
	$Background.modulate = color
		
