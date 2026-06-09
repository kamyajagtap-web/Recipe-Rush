# 3 second countdown 
# https://www.youtube.com/watch?v=ejRXpRlFa_Y
# Code tutorial followed for the variables and process method
extends Node2D

@onready var label = $Label
@onready var countdown = $Timer

func _ready():
	countdown.start()
	await get_tree().create_timer(3.0).timeout
	# After 3 seconds the first ingredient is shown
	var first_ingredient = Global.correct_order[0]
	get_tree().change_scene_to_file("res://cards/" + first_ingredient + ".tscn")

func time_left():
	return int(countdown.time_left)
	
func _process(delta):
	label.text = str(time_left())
