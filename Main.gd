extends Node2D

func _ready():
	while(true):
		settings.window_exists = true
		yield(get_tree().create_timer(2), "timeout")
		settings.window_exists = false
		yield(get_tree().create_timer(2), "timeout")
		

func _process(delta):
	$Path2D/PathFollow2D.unit_offset += delta/3


