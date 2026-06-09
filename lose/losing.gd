# Displays the loser's accuracy and redirects them to home
extends Node2D

func _ready():
	# Displays user's accuracy
	$result.text = str(int(Global.accuracy)) + "%"
	$TextureProgressBar.value = Global.accuracy
	
	# Waits momentarily before giving user the back home option
	$backbutton.visible = false
	await get_tree().create_timer(1.0).timeout
	$backbutton.visible = true

# Redirect user to home menu
func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

# Directs user to settings view
func _on_settings_pressed():
	Global.previous_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://settings.tscn")
