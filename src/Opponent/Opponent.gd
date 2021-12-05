extends KinematicBody2D

var speed = 250
var ball 

func _ready():
	ball = get_parent().find_node("Ball")
func _physics_process(delta):
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
