extends CharacterBody2D


const SPEED = 300.0

var ball

func _physics_process(delta):
	if ball:
		var ai_to_ball = self.global_position.direction_to(ball.global_position)

		ai_to_ball.x = 0
		ai_to_ball.y = snappedf(ai_to_ball.y, 0.01)

		if ai_to_ball.y > 0:
			ai_to_ball.y = 1
		elif ai_to_ball.y < 0:
			ai_to_ball.y = -1

		velocity.y = ai_to_ball.y * SPEED

		move_and_slide()


func _on_computer_ball_detection_body_entered(body):
	if body.name == "Ball":
		ball = body
