extends Node2D
class_name Fases

func _process(delta):
	if abs((int(global_position.y) - int(Global.player_position.y)))> 400:
			Global.levels_to_generate += 1
			queue_free()
#			print(global_position.distance_to(Global.player_position))
			

#
#func retirar_level():
#	if global_position.distance_to(Global.player_position) > 200:
#		queue_free()
#	print(global_position.distance_to(Global.player_position))
