extends Node

const GRID_SIZE = 64

var window_exists : bool = true setget set_window_existance

func set_window_existance(exists : bool) -> void:
	OS.window_borderless = false
	OS.window_per_pixel_transparency_enabled = !exists
	get_tree().get_root().set_transparent_background(!exists)
	OS.set_window_always_on_top(!exists)
	OS.window_maximized = true
	window_exists = exists
