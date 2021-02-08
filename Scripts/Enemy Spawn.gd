extends Position2D


signal instance_node(node, location)

export (PackedScene) var enemy



func _process(_delta):
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
	
		var action = round(rand_range(0, 20))
		
		if Global.enemys > 0:
			emit_signal("instance_node", enemy, global_position)
			Global.enemys -= 1
		
		
	else:
		queue_free()
