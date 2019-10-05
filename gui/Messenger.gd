extends Control

# the fornt used it 8mono
# https://fontlibrary.org/en/font/pixel-operator#Pixel%20Operator%208-Bold

var message_queue = []

var msg_length = 0
var msg_progress = 0
var auto_advance = true
var waiting = false
var cps = 20
var msg = ""

signal message_added

func _ready():
	pass

func _process(delta):
	if msg != "" and msg_progress <= msg_length * 1.5 + 20:
		msg_progress += cps * delta;
		$Label.visible_characters = msg_progress
	elif auto_advance:
		advance()
	else:
		pass # wait to advance

func add_message(msg : String, auto_advance : bool = true) -> void:
	message_queue.append({
		msg = msg,
		auto = auto_advance
	})
	emit_signal("message_added")

func advance() -> void:
	if message_queue.size() == 0:
		waiting = true
		yield(self, "message_added")
	
	waiting = false
	
	var temp = message_queue.pop_front()
	msg = temp.msg
	auto_advance = temp.auto
	
	msg_length = len(msg)
	msg_progress = 0
	
	$Label.visible_characters = msg_progress
	$Label.text = msg
