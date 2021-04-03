extends KinematicBody2D

onready var animPlayer = $AnimationPlayer
onready var lever = get_node("../Lever")

#set up signal from lever to elevator animation
#and set up when the animations are finished
func _ready():
	lever.connect("lever_pull_up",self,"stop")
	lever.connect("lever_pull_down",self,"move")

func move():
	animPlayer.play("Move")
	lever.finished("");
	
func stop():
	animPlayer.stop(false);
	lever.finished("");
