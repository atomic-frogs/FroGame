extends Node2D


func _process(delta):
	if global_position.distance_to(Global.player_position)> 56:
		print(global_position.distance_to(Global.player_position) )
#		global_position += 10 * global_position.direction_to(Global.player_position)
		global_position.y += 1 * (global_position.direction_to(Global.player_position)).y
