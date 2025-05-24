extends Node2D

@export var current_chapter : int = 1
@export var current_page : int = 1

@export var left : float = -500


func _ready() -> void:
	await  get_tree().process_frame
	UpdateMangasLabels()
	$page.text = str(current_page)
	ShowCurrentChapter()

func _on_buy_pressed() -> void:
	
	if Variables.coins > 10 and Variables.max_manga < 3:
		Variables.coins -= 10
		Variables.max_manga += 1
		UpdateMangasLabels()

func UpdateMangasLabels():
	for i in $Chapters.get_child_count():
		if i <= Variables.max_manga:
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
		UpdateMangasLabels()
		ShowCurrentChapter()
		ResetPages()

func _on_chapter_right_pressed() -> void:
	if current_chapter < 4 and current_chapter < Variables.max_manga+1:
		current_chapter += 1
		current_page = 1
		$page.text = str(current_page)
		UpdateMangasLabels()
		ShowCurrentChapter()
		ResetPages()


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
	var chapter = $Pages.get_node(str(current_chapter))
	var page = chapter.get_node(str(previous))
	
	var tween = create_tween()
	tween.tween_property(page, "position:x", left, 0.5)

func MovePageRight(next):
	var chapter = $Pages.get_node(str(current_chapter))
	var page = chapter.get_node(str(next))
	
	var tween = create_tween()
	tween.tween_property(page, "position:x", 350, 0.5)
	
func ShowCurrentChapter():
	$"Pages/1".hide()
	$"Pages/2".hide()
	$"Pages/3".hide()
	
	$Pages.get_node(str(current_chapter)).show()

func ResetPages():
	for i in 5:
		if i != 0:
			MovePageRight(i)
