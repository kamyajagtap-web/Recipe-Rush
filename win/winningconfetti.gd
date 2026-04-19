extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://win/winningaccuracy.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")
