extends Node2D
class_name Fases

func _process(delta):
	if global_position.distance_to(Global.player_position) > 200:
			queue_free()
			print(global_position.distance_to(Global.player_position))
			Global.levels_to_generate += 1


func retirar_level():
	if global_position.distance_to(Global.player_position) > 200:
		queue_free()
	print(global_position.distance_to(Global.player_position))
