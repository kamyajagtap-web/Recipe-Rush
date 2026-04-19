extends Node2D

func _ready():
	$result.text = str(int(Global.accuracy)) + "%"
	$TextureProgressBar.value = Global.accuracy
	$backbutton.visible = false
	await get_tree().create_timer(1.0).timeout
	$backbutton.visible = true

func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_settings_pressed():
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://settings.tscn")
