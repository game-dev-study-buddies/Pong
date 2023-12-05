extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Ball":
		print(body.name, " inside playerOneLossArea")
	# increment the other player's score
		PlayerVariables.player_two_score += 1
	# check if the game is over
	# despawn ball
	# check spawn direction
	# face ball spawn towards the other player
	# spawn ball
	else:
		print(body.name, " inside playerOneLossArea")
