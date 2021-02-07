extends Control


func _ready():
	Global.off = false
	
	$AnimatedSprite.play()
	
	if Global.new_highscore:
		$HighScore.text = str(round(Global.highScore))
		$Youdied2.show()
	else:
#		$HighScore.text = str(round(Global.highScore))
		$Lastplayed.text = str(round(Global.score_last_played))
	


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

