# Directs the user to the desired view
extends Node2D

func _on_howtoplay_pressed():
	get_tree().change_scene_to_file("res://howtoplay.tscn")

func _on_settings_pressed():
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://levels.tscn")
