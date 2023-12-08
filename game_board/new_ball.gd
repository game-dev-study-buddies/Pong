extends Node2D


@onready var Ball = preload("res://ball/ball.tscn")
var new_ball


func _on_ball_tree_exited():
	new_ball = Ball.instantiate()
	var board_center = Vector2(576, 320)
	new_ball.position = board_center
	add_child(new_ball)
	reset_ball()


func reset_ball():
	new_ball.tree_exited.connect(_on_ball_tree_exited)
