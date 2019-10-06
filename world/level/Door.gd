tool
extends StaticBody2D

export var open : bool = false setget set_open
var active = false

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	active = true

func set_open(state : bool) -> void:
	if open != state and active:
		open = state
		
		$Left/Particles2D.emitting = true
		$Right/Particles2D.emitting = true
		
		if open:
			$AnimationPlayer.play("open")
		else: 
			$AnimationPlayer.play("close")
