extends RigidBody2D

const left = -1
const right = 1

static var ball_speed = 300
static var ball_direction_h

var velocity

func _ready():
	spawn_ball()

func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		
		if collision_info.get_collider().name == "PlayerOneWall":
			PlayerVariables.player_two_score += 1
			if PlayerVariables.current_winner:
				PlayerVariables.last_winner = PlayerVariables.current_winner
			PlayerVariables.current_winner = 2
			queue_free()
		elif collision_info.get_collider().name == "PlayerTwoWall":
			PlayerVariables.player_one_score += 1
			if PlayerVariables.current_winner:
				PlayerVariables.last_winner = PlayerVariables.current_winner
			PlayerVariables.current_winner = 1
			queue_free()


func spawn_ball():
	velocity = get_ball_direction() * ball_speed

func get_ball_direction():
	if not PlayerVariables.current_winner:
		ball_direction_h = right if randf() >= 0.5 else left
	elif PlayerVariables.current_winner != PlayerVariables.last_winner:
		match PlayerVariables.current_winner:
			1:
				ball_direction_h = left
			2:
				ball_direction_h = right
	else:
		match ball_direction_h:
			left:
				ball_direction_h = right
			right:
				ball_direction_h = left

	var ball_direction_v = randf_range(-1,1)

	return Vector2(ball_direction_h, ball_direction_v).normalized()

