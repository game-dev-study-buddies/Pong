extends Node2D


@onready var Ball = preload("res://ball.tscn")
var new_ball


func _on_ball_tree_exited():
	new_ball = Ball.instantiate()
	new_ball.position = Vector2(575, 320)
	add_child(new_ball)
	print(new_ball.position)
	reset_ball()


func reset_ball():
	new_ball.tree_exited.connect(_on_ball_tree_exited)
