extends Node

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	score_achieved()
	#to make the ball stop in the beggining of the game

func _on_Left_body_entered(body):
	score_achieved()
	OpponentScore += 1
	
	

func _on_Right_body_entered(body):
	score_achieved()	
	PlayerScore += 1
	
	
func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left +1)) 


func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false
	
func score_achieved():
	$Ball.position = Vector2(640,360)
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
