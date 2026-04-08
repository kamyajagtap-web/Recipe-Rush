extends Area2D

var selected_order = []
var correct_order = ["milk", "sugar", "eggs", "bakingpowder", "butter", "flour", "salt"]

func _ready():
	for child in get_children():
		if child.has_signal("clicked"):
			child.clicked.connect(add_ingredient)

func add_ingredient(ingredient):
	selected_order.append(ingredient)

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")


func _on_bake_pressed():
	var correct_count = 0
	print(selected_order)
	for i in range(selected_order.size()):
		if selected_order[i] == correct_order[i]:
			correct_count += 1
	var accuracy = float(correct_count) / float(correct_order.size()) * 100
	if accuracy >= 90:
		get_tree().change_scene_to_file("res://win/winningconfetti.tscn")
	else:
		get_tree().change_scene_to_file("res://lose/losing.tscn")
