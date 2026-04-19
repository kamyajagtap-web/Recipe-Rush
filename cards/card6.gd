extends Node2D

func _ready():
	await get_tree().create_timer(Global.delay).timeout
	Global.current_card += 1
	var sequence = Global.easy
	if Global.level == "medium":
		sequence = Global.medium
	elif Global.level == "hard":
		sequence = Global.hard
	if Global.current_card >= sequence.size():
		get_tree().change_scene_to_file("res://bakearea.tscn")
	else:
		get_tree().change_scene_to_file(sequence[Global.current_card])
