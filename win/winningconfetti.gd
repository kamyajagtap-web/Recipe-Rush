# Transition from celebatory winning visual to accuracy view
extends Node2D

# Waits two seconds before showing winner's accuracy
func _ready():
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://win/winningaccuracy.tscn")

# Directs user to settings view
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")
