extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
