extends KinematicBody2D

onready var animPlayer = $AnimationPlayer
onready var lever = $Lever

#set up signal from lever to elevator animation
#and set up when the animations are finished
func _ready():
	lever.connect("lever_pull_up",self,"go_up")
	lever.connect("lever_pull_down",self,"go_down")
	animPlayer.connect("animation_finished",lever,"nodeFinished")

func go_down():
	animPlayer.play("MoveDown")

func go_up():
	animPlayer.play("MoveUp")
