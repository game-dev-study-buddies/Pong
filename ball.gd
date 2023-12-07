extends RigidBody2D

const BALL_SPEED_START = 300
var ball_speed = 300
@onready var ball_direction = Vector2.ZERO


var velocity


func _ready():
	spawn_ball()

func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		
		if collision_info.get_collider().name == "PlayerOneWall":
			PlayerVariables.player_two_score += 1
			queue_free()
		elif collision_info.get_collider().name == "PlayerTwoWall":
			PlayerVariables.player_one_score += 1
			queue_free()


func spawn_ball():
	ball_speed = BALL_SPEED_START
	var ball_direction_h = 1
	if (randf() >= 0.5):
		ball_direction_h = -1
	ball_direction = Vector2(ball_direction_h, randf_range(-1,1)).normalized()
	velocity = ball_direction * ball_speed

