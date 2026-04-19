extends Node

var accuracy := 0.0
var previous_scene := ""
var current_card = 0
var level = "easy"
var delay = 1.0

var easy = ["res://cards/card1.tscn", "res://cards/card2.tscn", "res://cards/card3.tscn", "res://cards/card4.tscn", 
"res://cards/card5.tscn", "res://cards/card6.tscn", "res://cards/card7.tscn"]
var medium = ["res://cards/card3.tscn", "res://cards/card1.tscn", "res://cards/card6.tscn", "res://cards/card4.tscn",
 "res://cards/card2.tscn", "res://cards/card7.tscn", "res://cards/card5.tscn"]
var hard = ["res://cards/card5.tscn", "res://cards/card2.tscn", "res://cards/card7.tscn", "res://cards/card1.tscn", 
"res://cards/card4.tscn", "res://cards/card6.tscn", "res://cards/card3.tscn"]
