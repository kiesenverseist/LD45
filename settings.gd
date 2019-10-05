extends Node

var window_exists : bool = true setget set_window_existance

var level_exists : bool = true setget set_level_exists
signal level_existance_set

func set_window_existance(exists : bool) -> void:
	OS.window_borderless = false
	OS.window_per_pixel_transparency_enabled = !exists
	get_tree().get_root().set_transparent_background(!exists)
	OS.set_window_always_on_top(!exists)
	OS.window_maximized = true
	window_exists = exists

func set_level_exists(exists : bool) -> void:
	if level_exists != exists:
		level_exists = exists
		emit_signal("level_existance_set", level_exists)
