extends Control


func _ready():
	
	if Global.new_highscore:
		$HighScore.text = "New High Score: " + str(Global.highScore)
	else:
		$HighScore.text = "High Score: " + str(Global.highScore)
		$Lastplayed.text = "Score: " + str(Global.score_last_played)
	


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

