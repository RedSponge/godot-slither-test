extends Node

@export var snake_pieces: Array[Node2D]

# Every interval seconds a new target is choswn
@export var interval = 0.1

@export var distance = 16

# If an arrow key is pressed, the snake will rotate by rotation power radians every second
@export var rotation_power = 3

@export var is_paused = false

var time_passed = 0

var selected_angle = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#advance_towards(Transform2D(2, Vector2(100, 100)))
	pass # Replace with function body.

func get_head() -> Node2D:
	if len(snake_pieces) == 0:
		return null
	return snake_pieces[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		is_paused = not is_paused
	
	if is_paused:
		return
	selected_angle += Input.get_axis("left", "right") * delta * rotation_power

func advance_towards(transform: Transform2D, duration: float):
	snake_pieces[0].set_target(transform, duration)
	for i in range(1, len(snake_pieces)):
		snake_pieces[i].set_target(snake_pieces[i - 1].transform, duration)	

func _physics_process(delta):
	if is_paused:
		return
	time_passed += delta
	if time_passed > interval:
		advance_towards(get_head().transform.rotated_local(selected_angle).translated(Vector2(0, distance).rotated(get_head().rotation + selected_angle)), interval)
		selected_angle = 0
		time_passed -= interval
	return
	var head = get_head()
	if head == null:
		print("Warning: No head piece!")
		return
	
