extends Node2D

onready var sprite = $Sprite

func set_state(n):
	sprite.set_frame(n)

func lock():
	set_state(0)
	
func unlock():
	set_state(1)
	
func completed():
	set_state(2)
