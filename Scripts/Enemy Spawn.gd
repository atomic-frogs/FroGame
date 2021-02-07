extends Position2D


signal instance_node(node, location)

export (PackedScene) var enemy

var enemys = 1

func _process(delta):
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
	
		var action = round(rand_range(0, 20))
		
		if enemys > 0:
			emit_signal("instance_node", enemy, global_position)
			enemys -= 1
		
		
	else:
		queue_free()
