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
	Global.world = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score = abs($Player.get_global_position().y) - starting
	label.text = str(int(score))
	
	Global.player_position = $Player.get_global_position()

func _exit_tree():
	Global.world = null


func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location

func end_game():
	if score > Global.highScore:
		Global.highScore = score
		Global.new_highscore = true
	else:
		Global.score_last_played = score
		Global.new_highscore = false
	get_tree().change_scene("res://Scenes/End Game.tscn")
	
