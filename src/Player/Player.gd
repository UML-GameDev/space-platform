extends KinematicBody2D

const SPEED = 200
const G = 1000
const FLOOR_DISTANCE = 50

onready var sprite = $AnimatedSprite
onready var ray = $RayCast2D

var snap_vec = Vector2.DOWN * FLOOR_DISTANCE
var velocity = Vector2()

func get_input():
	velocity.x = 0
	if(Input.is_action_pressed("right")):
		#move right
		velocity.x += SPEED
		#flip the sprite and raycast
		sprite.flip_h = false;
		ray.scale.x = 1
	elif(Input.is_action_pressed("left")):
		#move left
		velocity.x += -SPEED
		sprite.flip_h = true;
		ray.scale.x = -1
#	pass

func _physics_process(delta):
	get_input()
	velocity.y += delta * G	
	velocity = move_and_slide_with_snap(velocity,snap_vec,Vector2.UP,true,4,0.9,false)
