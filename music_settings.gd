extends Control

# How to Create Sound Settings in Godot by CoffeeCrew
@onready var volume = $volume as Label
@onready var volumenum = $volumenum as Label
@onready var h_slider = $HSlider as HSlider

@export_enum("Master") var bus_name : String

var bus_index : int = 0

func _ready():
	h_slider.value_changed.connect(on_value_changed)
	get_bus_name()
	set_volume_label_text()
	set_slider_value()

func set_volume_label_text() -> void:
	volume.text = str(bus_name) + " Volume"

func set_num_label_text() -> void:
	volumenum.text = str(h_slider.value)
	
func get_bus_name() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_num_label_text()

func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_num_label_text()
