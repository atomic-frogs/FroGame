extends Control


func _ready():
	Global.off = false
	
	$AnimatedSprite.play()
	
	if Global.new_highscore:
		$HighScore.text = "New High Score: " + str(Global.highScore)
	else:
		$HighScore.text = "High Score: " + str(round(Global.highScore))
		$Lastplayed.text = "Score: " + str(round(Global.score_last_played))
	


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

