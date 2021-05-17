extends Area2D

signal lever_pull_down()
signal lever_pull_up()

onready var animPlayer = $AnimationPlayer
onready var sprite = $Sprite

export var isPulled = false
var canPull = true

func _ready():
	sprite.frame = 5 if isPulled else 0
	animPlayer.connect("animation_finished",self,"animFinished")


#Call when the lever is allow to interact again
func nodeFinished(_name):
	canPull = true

func animFinished(name):
	match(name):
		"PullUp":	
			emit_signal("lever_pull_up")
		"PullDown":
			emit_signal("lever_pull_down")

#When player interacted with lever
#it will check whether is can be pulled and which direction to pull
func interacted():
	if(!animPlayer.is_playing() and canPull):
		canPull = false
		if(isPulled):
			isPulled = false
			animPlayer.play("PullUp")
		else:
			isPulled = true
			animPlayer.play("PullDown")
