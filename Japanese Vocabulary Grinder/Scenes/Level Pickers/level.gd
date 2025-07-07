extends Node2D

@export var select_color : Color

func UNSELECT():
	$LevelName.set("theme_override_colors/font_color", Color.DARK_SLATE_GRAY)

func SELECT():
	$LevelName.set("theme_override_colors/font_color", select_color)
