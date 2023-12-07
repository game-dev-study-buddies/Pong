extends Node

var score_one = 0
var player_one_score: int:
	get:
		return score_one
	set(value):
		score_one = value

var score_two = 0
var player_two_score: int:
	get:
		return score_two
	set(value):
		score_two = value

var current_text = ""
var game_end_text: String:
	get:
		return current_text
	set(value):
		current_text = value

var current_winner
var last_winner
