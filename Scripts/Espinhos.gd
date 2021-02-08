extends Node2D

var speed = 1

func _process(delta):
#	if abs((int(global_position.y) - int(Global.player_position.y)))> 56:
#		print(int(global_position.y) % int(Global.player_position.y))
##		global_position += 10 * global_position.direction_to(Global.player_position)
#		global_position.y += 1 * (global_position.direction_to(Global.player_position)).y
	speed = Global.score * 1.1
	clamp(speed, 0, 100)
	global_position.y -= speed * delta
