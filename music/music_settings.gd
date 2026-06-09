# Sound adjustment for background music
# Followed code tutorial: https://www.youtube.com/watch?v=yWvqvjLJ5Ko
extends Control

@onready var volume = $volume as Label
@onready var volumenum = $volumenum as Label
@onready var h_slider = $HSlider as HSlider

@export_enum("Master") var bus_name : String

var bus_index : int = 0

# Sets up the music data
func _ready():
	h_slider.value_changed.connect(on_value_changed)
	get_bus_name()
	set_volume_label_text()
	set_slider_value()

# Sets the volume title with the music bus's name
func set_volume_label_text() -> void:
	volume.text = str(bus_name) + " Volume"

# Manages the volume amount when adjusted
func set_num_label_text() -> void:
	volumenum.text = str(h_slider.value)

# Gets the audio bus's index form the name
func get_bus_name() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

# Applies the audio system's volume to the volume adjuster
func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_num_label_text()

# Adjusts volume according to the slider's adjustment
func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_num_label_text()
