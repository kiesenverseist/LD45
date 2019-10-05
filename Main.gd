extends Node2D

var level = preload("res://world/level/Level.tscn")

func _ready():
	$GUI/Messenger.add_message("test1")
	$GUI/Messenger.add_message("UwU")
	$GUI/Messenger.add_message("A MUCH LONGERERERER MESSAGIOLELELE")
	$GUI/Messenger.add_message("... Well this is a somewhat less than ideal situation")
	$GUI/Messenger.add_message("")
	
	var l = level.instance()
	l.name = "Level"
	add_child(l)
	settings.window_exists = true
	yield(get_tree().create_timer(2), "timeout")
	get_node("Level").queue_free()
	settings.window_exists = false
	yield(get_tree().create_timer(2), "timeout")
	l = level.instance()
	l.name = "Level"
	add_child(l)
	yield(get_tree().create_timer(2), "timeout")
	settings.window_exists = true

func _process(delta):
	$Path2D/PathFollow2D.unit_offset += delta/3
