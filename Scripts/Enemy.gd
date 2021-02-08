extends Area2D


var speed = 10
var velocity
var death = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	speed = Global.score * 1.5
	clamp(speed, 0, 10)
	global_position.y -= speed * delta

	global_position += speed * global_position.direction_to(Global.player_position) * delta
	
	
	if Global.off:
		if !death:
			$AnimationPlayer.play("death")
			death = true
		if !$AnimationPlayer.is_playing():
			
			Global.enemys += 1
			queue_free()
	else:
		$AnimationPlayer.play("Normal")




func _on_Enemy_body_entered(body):
	if body.is_in_group("player") and body.has_method("kill"):
		body.kill()
