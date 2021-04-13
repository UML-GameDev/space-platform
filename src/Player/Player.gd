extends KinematicBody2D

const SPEED = 350
const G = 1000
const FLOOR_DISTANCE = 50

onready var sprite = $AnimatedSprite
onready var interactRay = $InteractRay
onready var platform_ray = $PlatformRay

var snap_vec = Vector2.DOWN * FLOOR_DISTANCE
var velocity = Vector2()

func get_input():
	velocity.x = 0
	if(Input.is_action_pressed("right")):
		#move right
		velocity.x += SPEED
		#flip the sprite and raycast
		sprite.flip_h = false;
		interactRay.scale.x = 1
	elif(Input.is_action_pressed("left")):
		#move left
		velocity.x += -SPEED
		sprite.flip_h = true;
		interactRay.scale.x = -1
#	pass

func _physics_process(delta):
	get_input()
	velocity.y += delta * G	
	var is_on_platform = platform_ray.is_colliding()
	velocity = move_and_slide_with_snap(velocity,snap_vec,Vector2.UP,not is_on_platform,4,0.9,false)
