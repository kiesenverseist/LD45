extends Node2D

func _ready():
	$GUI/Messenger.add_message("test1")
	$GUI/Messenger.add_message("UwU")
	$GUI/Messenger.add_message("A MUCH LONGERERERER MESSAGIOLELELE")
	$GUI/Messenger.add_message("... Well this is a somewhat less than ideal situation")
	$GUI/Messenger.add_message("")
	
#	while(true):
#		settings.window_exists = true
#		yield(get_tree().create_timer(2), "timeout")
	settings.window_exists = false
#		yield(get_tree().create_timer(2), "timeout")

func _process(delta):
	$Path2D/PathFollow2D.unit_offset += delta/3
