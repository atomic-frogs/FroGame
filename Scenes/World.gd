extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var starting 

onready var label = $Player/Score

# Called when the node enters the scene tree for the first time.
func _ready():
	starting = $Player.get_global_position().y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score = abs($Player.get_global_position().y) - starting
	label.text = str(int(score))
