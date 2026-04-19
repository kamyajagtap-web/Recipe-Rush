extends Area2D

var selected_order = []
var easy_correct_order = ["milk", "sugar", "eggs", "bakingpowder", "butter", "flour", "salt"]
var med_correct_order = ["eggs", "milk", "flour", "bakingpowder", "sugar", "salt", "butter"]
var hard_correct_order = ["butter", "sugar", "salt", "milk", "bakingpowder", "flour", "eggs"]

func _ready():
	for child in get_children():
		if child.has_signal("clicked"):
			child.clicked.connect(add_ingredient)

func add_ingredient(ingredient):
	selected_order.append(ingredient)

func _on_settings_pressed():
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_bake_pressed():
	var correct_count = 0
	var correct_order = easy_correct_order
	if Global.level == "medium":
		correct_order = med_correct_order
	elif Global.level == "hard":
		correct_order = hard_correct_order
	for i in range(selected_order.size()):
		if selected_order[i] == correct_order[i]:
			correct_count += 1
	var accuracy = float(correct_count) / float(correct_order.size()) * 100
	Global.accuracy = accuracy
	if accuracy >= 80:
		get_tree().change_scene_to_file("res://win/winningconfetti.tscn")
	else:
		get_tree().change_scene_to_file("res://lose/losing.tscn")
