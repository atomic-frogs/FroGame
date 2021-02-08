extends Position2D

signal instance_node(node, location)
signal instance_fase(node, location)
export (PackedScene) var block
export (int) var grid_size_x
export (int) var max_blocks

var altura_level = 0
var fase

var fase2 = preload("res://Scenes/Fases/fase2.tscn")
var fase3 = preload("res://Scenes/Fases/fase3.tscn")
var fase5 = preload("res://Scenes/Fases/fase5.tscn")
var lista_fases = {
	"fase3": fase3,
	"fase2": fase2,
	"Fase5": fase5
}


var current_block_number = 0


func _process(delta):
	if Global.levels_to_generate > 0:
		print(Global.levels_to_generate)
		if Global.world != null:
			if !is_connected("instance_node", Global.world, "instance_node"):
				connect("instance_node", Global.world, "instance_node")
			elif !is_connected("instance_fase", Global.world, "instance_fase"):
				connect("instance_fase", Global.world, "instance_fase")
		
		
#		if current_block_number < max_blocks:
#		var action = round(rand_range(0, 30))
#
#		if action >= 10 and action < 20:
#			emit_signal("instance_node", fase2, global_position)
#		elif action < 10:
#			emit_signal("instance_node", fase3, global_position)
#		if action > 20:
#			emit_signal("instance_node", fase5, global_position)
#		f
		fase = fase_random()
		emit_signal("instance_fase", fase, global_position)
		global_position.y -= altura_level
		
		Global.levels_to_generate -= 1
#		print(Global.levels_to_generate)

func fase_random():
	var a = lista_fases.values()
#	lista_fases.
	return a[randi() % a.size()]
