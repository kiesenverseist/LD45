extends Node2D

var level = preload("res://world/level/LevelMain.tscn")
var boss_area_active = false

func _ready():
	settings.connect("level_existance_set", self, "level_existance")
	
	yield(get_tree().create_timer(1), "timeout")
	boss_area_active = true
	settings.window_exists = true
	
#	settings.level_exists = false
#	yield(get_tree().create_timer(1), "timeout")
#	settings.level_exists = true
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

func _on_BossArea_trigger(enter):
	if boss_area_active and enter:
		$Level/TriggerArea.queue_free()
		
		$Level/Camera2D.global_position = $Player/Camera2D.global_position
		$Level/Camera2D.zoom = $Player/Camera2D.zoom
		$AnimationPlayer.play("end start")
		$GUI/Messenger.add_message("Hello")
		$GUI/Messenger.add_message("So its you huh?")
		$GUI/Messenger.add_message("...")
		$GUI/Messenger.add_message("The only one to have come so far.")
		$GUI/Messenger.add_message("Well, I suppose it is time to face you.")
		$GUI/Messenger.add_message("FACE THE POWER OF AN ENTITY SO ANC-")
		$GUI/Messenger.add_message("Huh? Wai- NO! NOT LIKE THIS!")
		$GUI/Messenger.add_message("!!!-")
		$GUI/Messenger.add_message("")

func reset_world():
	$AnimationPlayer.stop(false)
	settings.level_exists = false
	settings.window_exists = false
	$Boss.queue_free()
	$Player/Camera2D.current = true
	$AnimationPlayer.play("blank start")
	
