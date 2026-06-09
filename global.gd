# Initializes and stores variables/methods that are used across different scenes
extends Node

var accuracy = 0.0
var previous_scene = ""
var current_card = 0
var level = ""
var delay = 1.0
var correct_order = []

# Stores possible sequences of ingredient cards for each level
var easy_orders = [
	["milk", "sugar", "eggs", "bakingpowder", "flour", "salt"],
	["eggs", "flour", "milk", "sugar", "salt", "bakingpowder"],
	["sugar", "milk", "salt", "flour", "eggs", "bakingpowder"],
	["bakingpowder", "eggs", "salt", "sugar", "milk", "flour"]
]
var med_orders = [
	["eggs", "milk", "flour", "bakingpowder", "sugar", "salt", "butter"],
	["butter", "sugar", "eggs", "milk", "flour", "salt", "bakingpowder"],
	["milk", "butter", "eggs", "sugar", "bakingpowder", "flour", "salt"],
	["salt", "bakingpowder", "sugar", "eggs", "butter", "milk", "flour"]
]
var hard_orders = [
	["butter", "vanilla", "sugar", "salt", "milk", "bakingpowder", "flour", "cocoa", "eggs"],
	["cocoa", "butter", "eggs", "vanilla", "sugar", "milk", "salt", "flour", "bakingpowder"],
	["vanilla", "cocoa", "butter", "sugar", "eggs", "milk", "flour", "bakingpowder", "salt"],
	["salt", "eggs", "milk", "flour", "cocoa", "butter", "sugar", "bakingpowder", "vanilla"]
]

# Randomly picks an order from the level's orders
func pick_order():
	if level == "medium":
		correct_order = med_orders.pick_random()
	elif level == "hard":
		correct_order = hard_orders.pick_random()
	else:
		correct_order = easy_orders.pick_random() 
