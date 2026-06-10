# Sets the time amount between cards and picks a random card sequence
# based on the level the user picks
extends Node2D

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

# Sets up the easy mode with slower timing and a random easy sequence before counting down
func _on_easy_pressed():
	Global.level = "easy"
	Global.delay = 1.0
	Global.current_card = 0
	Global.pick_order()
	get_tree().change_scene_to_file("res://countdown.tscn")

# Sets up medium mode with moderate timing and a random medium sequence before countding down
func _on_medium_pressed():
	Global.level = "medium"
	Global.delay = 0.5
	Global.current_card = 0
	Global.pick_order()
	get_tree().change_scene_to_file("res://countdown.tscn")

# Sets up hard mode with fast timing and a random hard sequence before counting down
func _on_hard_pressed():
	Global.level = "hard"
	Global.delay = 0.25
	Global.current_card = 0
	Global.pick_order()
	get_tree().change_scene_to_file("res://countdown.tscn")
