extends Node2D


func _process(delta):
	if PlayerVariables.player_one_score == 11 or PlayerVariables.player_two_score == 11:
		get_tree().paused = true
		get_node("GameOver").show()
	else:
		get_node("GameOver").hide()
