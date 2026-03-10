extends TextureButton

## Saves index of audio bus being used
var master_bus = AudioServer.get_bus_index("Master")

## Mutes and unmutes the music when button is clicked
func _on_pressed():
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
