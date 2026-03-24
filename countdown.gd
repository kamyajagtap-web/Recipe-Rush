extends Node2D

@onready var label = $Label
@onready var countdown = $Timer

func _ready():
	countdown.start()

func time_left():
	return int(countdown.time_left)
	
func _process(delta):
	label.text = str(time_left())
	
	
