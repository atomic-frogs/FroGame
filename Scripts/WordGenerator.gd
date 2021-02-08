extends Position2D

signal instance_node(node, location)

export (PackedScene) var block
export (int) var grid_size_x
export (int) var max_blocks

var fase2 = preload("res://Scenes/Fases/fase2.tscn")
var fase3 = preload("res://Scenes/Fases/fase3.tscn")
var lista_fases = {
	"fase3": fase3,
	"fase2": fase2
}


var current_block_number = 0


func _process(delta):
	if Global.levels_to_generate > 0:
		print(Global.levels_to_generate)
		if Global.world != null:
			if !is_connected("instance_node", Global.world, "instance_node"):
				connect("instance_node", Global.world, "instance_node")
		
		
#		if current_block_number < max_blocks:
		var action = round(rand_range(0, 20))
		
		if action >= 10:
			emit_signal("instance_node", fase2, global_position)
		elif action < 10:
			emit_signal("instance_node", fase3, global_position)
		
		global_position.y -= 180
		
		Global.levels_to_generate -= 1
#		print(Global.levels_to_generate)

