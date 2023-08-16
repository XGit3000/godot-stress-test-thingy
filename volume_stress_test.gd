extends Node3D

@export var test_ui_node : StressTestUI
@export var test_instance_scene : PackedScene
var stage : int = StressTest.STAGE.READY
var base_fps : int = 60
var test_fps : int = 60
var total_things : int = 1
var current_total : int = 1
var size_x : int = 1
var size_y : int = 1
var size_z : int = 1
@export var test_node : Node3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match stage:
		StressTest.STAGE.CONTROL:
			
			test_ui_node.update_perfomance_label("Resolution: %sx%s\n%s FPS"%[get_viewport().get_visible_rect().size.x,get_viewport().get_visible_rect().size.y,(Engine.get_frames_per_second())])
		StressTest.STAGE.TEST:
			test_ui_node.test_data_label.text = "Things: %s/%s (%3.4f)\n%s FPS\n%3.4f%s Relative Performance\nFrame Time: %3.4f ms"%[current_total,total_things,100.0*float(current_total)/total_things,Engine.get_frames_per_second(),float(Engine.get_frames_per_second())/base_fps*100.0,"%", delta*1000.0]
	pass

func add_the_stuff(): #i'm just done, man
	var new_node = Node3D.new()
	var current_time : int = Time.get_ticks_usec()
	var things_total : int = 0
	for x in range(size_x):
		for y in range(size_y):
			for z in range(size_z):
				var new_thing = test_instance_scene.instantiate()
				new_node.add_child(new_thing)
				new_thing.position = Vector3(x+3,y+3,z+3)
				things_total += 1
#				prints(x,y,z)
#				print(things_total)
#				print(100.0*float(things_total)/total_things)
				current_total = things_total
				var new_time : int = Time.get_ticks_usec()
				if (new_time-current_time) > 1.0e+6/60.0:
					await RenderingServer.frame_post_draw
					current_time = Time.get_ticks_usec()
#				if (Time.get_ticks_usec()/1.0e+6)-current_total>1.0/60.0:
#					await RenderingServer.frame_post_draw
#					await RenderingServer.frame_post_draw
#					await RenderingServer.frame_post_draw
#					await RenderingServer.frame_post_draw
#					#total_things = things_total # favorite line so far # wrong variable :(
##					current_total = things_total
#					current_time = Time.get_ticks_usec()/1.0e+6
	test_node.add_child(new_node)
	test_ui_node.test_status_label.text = "Measuring Relative Performance..."
	$"Test Timer".start()
	pass

func _on_input_ui_launch_test():
	size_x = test_ui_node.x_size
	size_y = test_ui_node.y_size
	size_z = test_ui_node.z_size
	total_things = size_x*size_y*size_z
	print("brudghd")
#	var thing = Vector2i(get_viewport().get_visible_rect().size)
#	ProjectSettings.set_setting("display/window/size/viewport_width", thing.x)
#	ProjectSettings.set_setting("display/window/size/viewport_height", thing.y)
#	DisplayServer.window_set_size(thing)
	get_tree().root.unresizable = true
#	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
#	get_viewport().set_size_2d_override(thing)D q	
	var ugh = self.get_viewport()
	print(ugh.get_class())
	print(get_window().get_class())
	print(get_viewport().get_class())
	print(get_window().get_viewport().get_viewport().get_class())
	print(get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_class())
	print(get_viewport().get_window().get_viewport().get_window().get_class())
	print(get_window().get_window().get_window().get_viewport().get_window().get_class())
	print(get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_window().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_window().get_viewport().get_window().get_window().get_window().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_viewport().get_window().get_viewport().get_viewport().get_window().get_window().get_window().get_viewport().get_window().get_viewport().get_viewport().get_viewport().get_viewport().get_window().get_viewport().get_window().get_window().get_window().get_viewport().get_class())
#	get_tree().root.size = thing
#	get_tree().root.get_viewport().set_
	test_ui_node.stage = StressTest.STAGE.CONTROL
	stage = StressTest.STAGE.CONTROL
	$"Base Performace Capture Timer".start()
	pass # Replace with function body.


func _on_base_performace_capture_timer_timeout():
	test_ui_node.stage = StressTest.STAGE.TEST
	stage = StressTest.STAGE.TEST
	base_fps = Engine.get_frames_per_second()
	add_the_stuff()
	pass # Replace with function body.


func _on_test_timer_timeout():
	test_fps = Engine.get_frames_per_second()
	stage = StressTest.STAGE.COMPLETE
	test_ui_node.stage = StressTest.STAGE.COMPLETE
	get_tree().root.unresizable = false
	for child in test_node.get_children():
		child.queue_free()
	test_ui_node.test_complet_data_label.text = "Total Things: %s\nRelative Performance: %3.4f%s\nControl FPS: %s\nTest FPS: %s"%[total_things,float(test_fps)/base_fps*100.0,"%",base_fps,test_fps]
	pass # Replace with function body.
