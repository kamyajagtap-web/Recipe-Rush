# Exits user out of playing instructions back to home 
extends Node2D

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
