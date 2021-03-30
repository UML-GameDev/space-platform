extends KinematicBody2D

export (int) var SPEED = 200
export (int) var G = 1000

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	velocity.x = 0
	if(Input.is_action_pressed("right")):
		#move right
		velocity.x += SPEED
	elif(Input.is_action_pressed("left")):
		#move left
		velocity.x += -SPEED
	else:
		velocity.x = 0
#	pass

func _physics_process(delta):
	get_input()
	velocity.y += delta * G
	velocity = move_and_slide(velocity,Vector2(0,-1))
