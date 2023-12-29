extends Node2D


@export var speed = 100.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dx = Input.get_axis("left", "right")
	var dy = Input.get_axis("up", "down")
	position += Vector2(dx, dy) * delta * speed;

