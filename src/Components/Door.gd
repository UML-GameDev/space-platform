extends Area2D

onready var door_anim = get_node("AnimationPlayer")
onready var door_col = get_node("CollisionShape")
onready var levers = get_node("../DoorLevers").get_children()
onready var indicators = get_node("Indicators").get_children()
var completed_count = 0
var isOpen = false

func _ready():
	for l in levers:
		l.connect("lever_pull_down",self,"unlock")
		l.connect("lever_pull_up",self,"lock")
	door_col.set_disabled(true)

func unlock(i):
	if(i >= 0 && i < indicators.size()):
		indicators[i].unlock()
		completed_count += 1
		check()
		
func lock(i):
	if(i >= 0 && i < indicators.size()):
		completed_count -= 1
		check()
		indicators[i].lock()

func check():
	if(completed_count == indicators.size()):
		open()
		isOpen = true
		for l in indicators:
			l.completed()
	else:
		if isOpen:
			isOpen = false
			close()
			for l in indicators:
				l.unlock()

		
		

func open():
	door_anim.play("Open")
	door_col.set_disabled(false)

func close():
	door_anim.play("Close")
	door_col.set_disabled(true)
	
