extends Area2D

var player_on_area = false

func _process(delta):
	if player_on_area:
		$Press.show()
		if Input.is_action_just_pressed("onoff") and !Global.off:
			Global.off = true
			$Sprite2.show()
			
		elif Input.is_action_just_pressed("onoff"):
			Global.off = false
			$Sprite2.hide()
		
	else:
		$Press.hide()
	

func _on_Interruptor_body_entered(body):
	if body.is_in_group("player"):
		player_on_area = true



func _on_Interruptor_body_exited(body):
	if body.is_in_group("player"):
		player_on_area = false
