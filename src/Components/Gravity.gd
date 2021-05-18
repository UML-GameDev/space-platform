extends Area2D

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		body.zero_gravity = true


func _on_Area2D_body_exited(body):
	if(body.name == "Player"):
		body.zero_gravity = false
