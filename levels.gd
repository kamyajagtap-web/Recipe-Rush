extends Node2D

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_easy_pressed():
	Global.level = "easy"
	Global.delay = 1.0
	Global.current_card = 0
	get_tree().change_scene_to_file("res://countdown.tscn")

func _on_medium_pressed():
	Global.level = "medium"
	Global.delay = 0.5
	Global.current_card = 0
	get_tree().change_scene_to_file("res://countdown.tscn")

func _on_hard_pressed():
	Global.level = "hard"
	Global.delay = 0.25
	Global.current_card = 0
	get_tree().change_scene_to_file("res://countdown.tscn")
