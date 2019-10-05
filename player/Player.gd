extends KinematicBody2D

var speed : int = 250 #pixels / second
var move : Vector2 = Vector2(0,0)
var grid_pos : Vector2 = Vector2(5,5)
var is_moveing : bool = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if not is_moveing:
		move.y = int(Input.is_action_pressed("move_down")) \
				- int(Input.is_action_pressed("move_up"))
		move.x = int(Input.is_action_pressed("move_left")) \
				- int(Input.is_action_pressed("move_right"))
		
		grid_pos += move

func _physics_process(delta):
	var to_move = grid_pos * settings.GRID_SIZE - position
	
	if to_move.length() > speed * delta:
		to_move = to_move.normalized() * speed
		is_moveing = true
		move_and_slide(to_move)
	else:
		position = grid_pos * settings.GRID_SIZE
		is_moveing = false
	
