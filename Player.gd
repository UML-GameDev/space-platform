extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_input():
	velocity.x = 0
	if(Input.is_action_pressed("right")):
		#move right
		velocity.x += 1
	if(Input.is_action_pressed("left")):
		#move left
		velocity.x += -1
	velocity = velocity.normalized()*speed
#	pass

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
