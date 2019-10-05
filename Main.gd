extends Node2D

func _ready():
#	get_tree().get_root().set_transparent_background(true)
	OS.window_maximized = true

func _process(delta):
	$Path2D/PathFollow2D.unit_offset += 0.01
