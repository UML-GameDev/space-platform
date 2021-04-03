extends Node

# Called when the node enters the scene tree for the first time.
func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()
