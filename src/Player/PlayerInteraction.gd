extends RayCast2D

func _process(_delta):
	if(Input.is_action_pressed("interact")):
		if(is_colliding()):
			check_collision()

#check if there interactable object within the ray distance
func check_collision():
	var obj = get_collider()
	if(obj is Node2D and obj.is_in_group("interactable")):
		if(obj.has_method("interacted")):
			obj.interacted()
