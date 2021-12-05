extends Node

var PlayerScore = -2
var OpponentScore = -2

func _on_Left_body_entered(body):
	$Ball.position = Vector2(640,360)
	OpponentScore += 1
	get_tree().call_group("BallGroup", "stop_ball")
	

func _on_Right_body_entered(body):
	$Ball.position = Vector2(640, 360)
	PlayerScore += 1
	
	
func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)


func _on_CountdownTimer_timeout():
	pass # Replace with function body.
