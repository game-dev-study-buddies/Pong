extends RigidBody2D

const LEFT = -1
const RIGHT = 1
const SPEED = 300
const SPEED_MULTIPLIER = 1.15

var velocity
static var ball_direction_h

func _ready():
	spawn_ball()


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())

		var collider = collision_info.get_collider().name

		if collider == "PlayerOneWall":
			PlayerVariables.player_two_score += 1
			if PlayerVariables.current_winner:
				PlayerVariables.last_winner = PlayerVariables.current_winner
			PlayerVariables.current_winner = 2
			queue_free()
		elif collider == "PlayerTwoWall":
			PlayerVariables.player_one_score += 1
			if PlayerVariables.current_winner:
				PlayerVariables.last_winner = PlayerVariables.current_winner
			PlayerVariables.current_winner = 1
			queue_free()
		elif collider != "WorldBoundary":
			velocity *= SPEED_MULTIPLIER


func spawn_ball():
	velocity = get_ball_direction() * SPEED


func get_ball_direction():
	if not PlayerVariables.current_winner:
		ball_direction_h = RIGHT if randf() >= 0.5 else LEFT
	elif PlayerVariables.current_winner != PlayerVariables.last_winner:
		match PlayerVariables.current_winner:
			1:
				ball_direction_h = LEFT
			2:
				ball_direction_h = RIGHT
	else:
		match ball_direction_h:
			LEFT:
				ball_direction_h = RIGHT
			RIGHT:
				ball_direction_h = LEFT

	var ball_direction_v = randf_range(-1,1)

	return Vector2(ball_direction_h, ball_direction_v).normalized()

