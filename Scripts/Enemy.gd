extends KinematicBody2D


var speed = 10
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = speed * (Global.player_position.normalized()) * delta
	print(Global.player_position.normalized())
	velocity = move_and_collide(velocity)
	
