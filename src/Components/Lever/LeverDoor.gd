extends "res://src/Components/Lever/Lever.gd"

export (int) var id

func animFinished(name):
	match(name):
		"PullUp":	
			emit_signal("lever_pull_up",id)
		"PullDown":
			emit_signal("lever_pull_down",id)

func interacted():
	if(!animPlayer.is_playing()):
		if(isPulled):
			isPulled = false
			animPlayer.play("PullUp")
		else:
			isPulled = true
			animPlayer.play("PullDown")
