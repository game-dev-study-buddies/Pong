extends RigidBody2D


var velocity = Vector2(300,300)
var rand_direction = randi_range(0,1)


func _physics_process(delta):
	var collision_info
#	if rand_direction == 0:
#		collision_info = move_and_collide(-velocity * delta)
#	else:
	collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
