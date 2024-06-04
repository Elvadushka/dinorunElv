extends CanvasLayer

signal start_game_btn

var Score=0
var Highscore=0
var is_playing=false


func update_Score_label():
	Score=Score + 10
	$ScoreLabel.text ="Score: %d"%(Score)


func update_Higscore_lable():
	if Score > Highscore:
		Highscore=Score
		$ScoreLabel.text="Higscore: %d"%(Highscore)
	is_playing = false
		
func _on_puchale_play_pressed():
	start_game_btn.emit()
	is_playing=true
	$Scoretimer.start()
	$"Puchale play".visible=false
	
	
func _on_scoretimer_timeout():
	update_Score_label() 

