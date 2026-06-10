# Exits out of settings to the view the user was last on
extends Node2D

func _on_exit_pressed():
	get_tree().change_scene_to_file(Global.previous_scene)
