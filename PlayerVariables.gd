extends Node


var player_one_score = 0
var player_two_score = 0


var current_text = ""
var game_end_text: String:
	get:
		return current_text
	set(value):
		current_text = value
