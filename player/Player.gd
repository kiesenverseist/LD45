extends KinematicBody2D

var speed : int = 250 #pixels / second
var move : Vector2 = Vector2(0,0)
var grid_pos : Vector2 = Vector2(0,0)
var is_moveing : bool = false

var bob = 3
var t = 0

onready var level : NodePath = NodePath("../Level")

func _ready():
	pass # Replace with function body.

func _process(delta):
	move.y = int(Input.is_action_pressed("move_down")) \
			- int(Input.is_action_pressed("move_up"))
	move.x = int(Input.is_action_pressed("move_left")) \
			- int(Input.is_action_pressed("move_right"))
	
	if move.length() > 0:
		if move.y > 0:
			$icon.frame = 1
		if move.y < 0:
			$icon.frame = 2
		if move.x > 0:
			$icon.flip_h = false
			$icon.frame = 0
		if move.x < 0:
			$icon.flip_h = true
			$icon.frame = 0
	
		bob = 4
		t += delta * 2
	else:
		bob = 2
		t += delta
		
#	z_index = -position.y
	
	$icon.position.y = bob * sin(t)
	t += delta
	if t >= PI: t = 0

func _physics_process(delta):
	move = move.normalized()
	var mov = Vector2(move.x, move.y * 2/3)
	move_and_slide(mov * speed)

