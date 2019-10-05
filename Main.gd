extends Node2D

var level = preload("res://world/level/LevelMain.tscn")

func _ready():
	settings.connect("level_existance_set", self, "level_existance")
	
	$GUI/Messenger.add_message("UwU")
	$GUI/Messenger.add_message("")
	
	yield(get_tree().create_timer(1), "timeout")
	settings.level_exists = false
	yield(get_tree().create_timer(1), "timeout")
	settings.level_exists = true
#	var l = level.instance()
#	l.name = "Level"
#	add_child(l)
#	settings.window_exists = true
#	yield(get_tree().create_timer(2), "timeout")
#	get_node("Level").queue_free()
#	settings.window_exists = false
#	yield(get_tree().create_timer(2), "timeout")
#	l = level.instance()
#	l.name = "Level"
#	add_child(l)
#	yield(get_tree().create_timer(2), "timeout")
#	settings.window_exists = true

func level_existance(exists : bool) -> void:
	if exists:
		var l = level.instance()
		l.name = "Level"
		add_child(l)
	else:
		get_node("Level").queue_free()
