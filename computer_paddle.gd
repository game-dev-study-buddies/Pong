extends CharacterBody2D


const SPEED = 300.0

var ball

func _ready():
	ball = $"../player_paddle"

func _physics_process(delta):
	var ai_to_ball = self.global_position.direction_to(ball.global_position)
	ai_to_ball.x = 0
	# round off the ai_to_ball.y so that the paddle doesn't vigorously
	# shake from top to bottom when the vector's y is close to 0
	ai_to_ball.y = snappedf(ai_to_ball.y, 0.01)

	
	if ai_to_ball.y > 0:
		ai_to_ball.y = 1
	elif ai_to_ball.y < 0:
		ai_to_ball.y = -1
		
	velocity.y = ai_to_ball.y * SPEED

	move_and_slide()
	
