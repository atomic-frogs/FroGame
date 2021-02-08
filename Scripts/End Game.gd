extends Control


func _ready():
	Global.off = false
	
	$AnimatedSprite.play()
	
	if Global.new_highscore:
		$HighScore.text = str(round(Global.highScore))
		$Youdied2.show()
	else:
#		$HighScore.text = str(round(Global.highScore))
		$HighScore.text = str(round(Global.score_last_played))
		print(Global.new_highscore )
		


func _on_Button_pressed():
	Global.new_highscore = false
	Global.levels_to_generate = 3
	get_tree().change_scene("res://Scenes/World.tscn")

