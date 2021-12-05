extends Node

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	score_achieved()
	$FinishGame.visible = false
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
	if PlayerScore == 10:
		$CountdownLabel.text = "YOU WIN!"
		end_game()
	elif OpponentScore == 10:
		$CountdownLabel.text = "YOU LOSE!"
		end_game()
		
func end_game():
	$FinishGame.visible = true
	$Ball.position = Vector2(640,360)
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownLabel.visible = true
	if Input.is_action_pressed("ui_right"):
		score_achieved()
		PlayerScore = 0
		OpponentScore = 0
		$FinishGame.visible = false
	

func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false
	
func score_achieved():
	$Ball.position = Vector2(640,360)
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
