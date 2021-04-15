extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var MAX_OXYGEN = 100
onready var currOxygen = 100.0
onready var canBreathe = true

onready var scale = get_node("Sprite/currOxygenBar")
onready var opacity = get_node("Sprite")
onready var toggle = get_node("/root/Main/Level/Lever")

onready var alpha = 1.0

onready var basePosition = scale.position.x

# Called when the node enters the scene tree for the first time.
func _ready():
	toggle.connect("lever_pull_up",self,"setBreathTrue")
	toggle.connect("lever_pull_down",self,"setBreathFalse")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (currOxygen >= MAX_OXYGEN) and canBreathe:
		# Oxygen meter fades out as soon as it's full
		if alpha > 0:
			if alpha > delta:
				alpha -= 2 * delta
				opacity.modulate.a = alpha
			else:	# Sets the alpha level to 0 (transparent)
				opacity.modulate.a = 0
				alpha = 0
	else:
		# Sets the alpha level to 1 (Opaque)
		# when the player can't breathe or has a non-full oxygen meter
		if alpha < 1:
			opacity.modulate.a = 1	
			alpha = 1
	
	# If the player can't breathe, lower the current oxygen every frame until it's 0
	if !canBreathe:
		if(currOxygen > delta):
			currOxygen -= (delta * 5) / 3 # Oxygen lasts a minute
			updateOxygen()
		else:
			currOxygen = 0
			updateOxygen()

	
	
	# If the player can breathe, fill the meter if it is not full
	if canBreathe and (currOxygen < MAX_OXYGEN):
		if currOxygen <= MAX_OXYGEN - 0.05:
			# Uses linear interpolation to gradually fill the meter
			# until it is nearly full
			currOxygen = lerp(currOxygen, MAX_OXYGEN, 0.1)
			updateOxygen()
		else:
			# Fills the oxygen meter if it is close enough to full
			currOxygen = MAX_OXYGEN
	pass


func updateOxygen():
	scale.scale.x = currOxygen / 100
	scale.position.x = basePosition * currOxygen / 100

func setBreathTrue():
	canBreathe = true
	toggle.nodeFinished("")

func setBreathFalse():
	canBreathe = false
	toggle.nodeFinished("")
