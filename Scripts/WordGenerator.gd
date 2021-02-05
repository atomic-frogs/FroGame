extends Position2D

signal instance_node(node, location)

export (PackedScene) var block
export (int) var grid_size_x
export (int) var max_blocks

#var fase2
#
#var lista_fases = {
#	"bloco": block,
#	"fase2": fase2
#}


var current_block_number = 0


func _process(delta):
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
	
	
	if current_block_number < max_blocks:
		var action = round(rand_range(0, 20))
		global_position.x += grid_size_x
		emit_signal("instance_node", block, global_position)
		current_block_number += 1
	else:
		queue_free()
