# Tracks player's ingredient choices and calculates accuracy of player's order to correct order
extends Area2D

var players_order = []

func _ready():
	$butter.visible = false
	$vanilla.visible = false
	$cocoa.visible = false
	
	# Unlocks ingredient(s) based on the level
	if Global.level == "medium":
		$butter.visible = true
	elif Global.level == "hard":
		$butter.visible = true
		$cocoa.visible = true
		$vanilla.visible = true
	
	# Goes through each ingredient and adds it to the player's order if they clicked on it
	for child in get_children():
		if child.has_signal("clicked") and child.visible:
			child.clicked.connect(add_ingredient)
			
# Adds clicked ingredient to player's order
func add_ingredient(ingredient):
	players_order.append(ingredient)

# Goes to settings and will go back to the playing scene if they click exit out of settings
func _on_settings_pressed():
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://settings.tscn")

# Calculates player's accuracy when they're finished (ready to bake)
func _on_bake_pressed():
	var correct_count = 0
	
	# Counts up correct matches between player's order and the correct order
	for i in range(players_order.size()):
		if players_order[i] == Global.correct_order[i]:
			correct_count += 1
	
	# Calculates percentage of correct matches out of total possible matches
	var accuracy = float(correct_count) / float(Global.correct_order.size()) * 100
	
	# Sets player's accuracy as global to be used in the results scene
	Global.accuracy = accuracy
	if accuracy > 80:
		get_tree().change_scene_to_file("res://win/winningconfetti.tscn")
	else:
		get_tree().change_scene_to_file("res://lose/losing.tscn")
