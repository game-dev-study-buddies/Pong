extends RigidBody2D

var ball_direction = Vector2.ONE
var ball_speed = 300

var velocity = ball_direction * ball_speed
var rand_direction = randi_range(0,1)


func _physics_process(delta):
	var collision_info
#	if rand_direction == 0:
#		collision_info = move_and_collide(-velocity * delta)
#	else:
	collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
