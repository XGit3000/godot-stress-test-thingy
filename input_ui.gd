extends Control
class_name StressTestUI

@export var x_size_spinbox : SpinBox
@export var x_size_slider : HSlider
var x_size : int = 1

@export var y_size_spinbox : SpinBox
@export var y_size_slider : HSlider
var y_size : int = 1

@export var z_size_spinbox : SpinBox
@export var z_size_slider : HSlider
var z_size : int = 1

@export var total_size_label : Label
@export var parent_control : Control
@export var input_control : Control
@export var capture_control : Control
@export var test_control : Control
@export var complete_control : Control

@export var performance_label : Label

@export var test_status_label : Label
@export var test_data_label : Label

@export var test_complet_data_label : Label

var stage : int = StressTest.STAGE.READY:
	set(n_stage):
		stage = n_stage
		disable_all()
		match stage:
			StressTest.STAGE.READY:
				enable(input_control)
			StressTest.STAGE.CONTROL:
				enable(capture_control)
			StressTest.STAGE.TEST:
				enable(test_control)
			StressTest.STAGE.COMPLETE:
				enable(complete_control)

# Called when the node enters the scene tree for the first time.
func _ready():
	x_size_spinbox.share(x_size_slider)
	y_size_spinbox.share(y_size_slider)
	z_size_spinbox.share(z_size_slider)
	pass # Replace with function body.

signal LaunchTest

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_dimensions():
	total_size_label.text = "Total: %s"%(x_size*y_size*z_size)

func disable(node : CanvasItem):
	node.visible = false
	node.process_mode = Node.PROCESS_MODE_DISABLED
	pass

func enable(node : CanvasItem):
	node.visible = true
	node.process_mode = Node.PROCESS_MODE_INHERIT

func disable_all():
	for child in parent_control.get_children():
		disable(child)

func _on_x_spin_box_value_changed(value):
	x_size = value
	update_dimensions()
	pass # Replace with function body.


func _on_y_spin_box_value_changed(value):
	y_size = value
	update_dimensions()
	pass # Replace with function body.


func _on_z_spin_box_value_changed(value):
	z_size = value
	update_dimensions()
	pass # Replace with function body.


func _on_launch_button_pressed():
	print("lol")
	emit_signal("LaunchTest")
	pass # Replace with function body.


func update_perfomance_label(text : String):
#	print(text)
	performance_label.text=text


func _on_restart_test_button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
