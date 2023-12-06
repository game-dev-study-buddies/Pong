extends RigidBody2D

const BALL_SPEED_START = 300
var ball_speed = 300
@onready var ball_direction = Vector2.ZERO


var velocity
var rand_direction = randi_range(0,1)

func _ready():
	spawn_ball()

func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		print(collision_info.get_collider().name)
		velocity = velocity.bounce(collision_info.get_normal())


func spawn_ball():
	ball_speed = BALL_SPEED_START
	var ball_direction_h = 1
	if (randf() >= 0.5):
		ball_direction_h = -1
	ball_direction = Vector2(ball_direction_h, randf_range(-1,1)).normalized()
	velocity = ball_direction * ball_speed
	print(ball_direction, velocity)
