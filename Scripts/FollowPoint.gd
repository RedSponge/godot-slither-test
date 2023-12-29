extends Node2D


var target: Transform2D
var total_time: float
var time_passed: float
var start: Transform2D
var has_target: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not has_target:
		return
		
	time_passed += delta
	var percent_finished = min(time_passed / total_time, 1)
	var desired_trasnform = start.interpolate_with(target, percent_finished)
	self.transform = desired_trasnform
	if percent_finished >= 1:
		clear_target()

func set_target(target: Transform2D, time: float):
	self.target = target
	self.start = self.transform
	self.time_passed = 0
	self.total_time = time
	self.has_target = true

func clear_target():
	self.target = Transform2D.IDENTITY
	self.start = Transform2D.IDENTITY
	self.time_passed = 0
	self.total_time = 0
	self.has_target = false
