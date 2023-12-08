extends Control



func _process(delta):
	if get_tree().paused:
		show()
	else:
		hide()



func _on_play_again_pressed():
	PlayerVariables.player_one_score = 0
	PlayerVariables.player_two_score = 0
	hide()
	get_tree().paused = false
	
