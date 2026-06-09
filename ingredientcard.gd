# Faciliates the ingredient cards shown on the screen
# by loading the next one or starting the bake process
extends Node2D

func _ready():
	# Waits level's amount of time before moving to next card
	await get_tree().create_timer(Global.delay).timeout
	Global.current_card += 1

	# Checks if all of the ingredients have been shown then the view changes to the kitchen
	# so the user can start playing
	if Global.current_card >= Global.correct_order.size():
		get_tree().change_scene_to_file("res://bakearea.tscn")
		return

	# Continues on to the next ingredient card to be shown
	var next_ingredient = Global.correct_order[Global.current_card]
	get_tree().change_scene_to_file("res://cards/" + next_ingredient + ".tscn")
