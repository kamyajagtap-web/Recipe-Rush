extends Node2D

@onready var label = $Label
@onready var countdown = $Timer

func _ready():
	countdown.start()
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://cards/card1.tscn")

func time_left():
	return int(countdown.time_left)
	
func _process(delta):
	label.text = str(time_left())
	
	
