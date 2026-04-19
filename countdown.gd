extends Node2D

@onready var label = $Label
@onready var countdown = $Timer

func _ready():
	countdown.start()
	await get_tree().create_timer(3.0).timeout
	var sequence = Global.easy
	if Global.level == "medium":
		sequence = Global.medium
	elif Global.level == "hard":
		sequence = Global.hard
	get_tree().change_scene_to_file(sequence[0])

func time_left():
	return int(countdown.time_left)
	
func _process(delta):
	label.text = str(time_left())
	
	
