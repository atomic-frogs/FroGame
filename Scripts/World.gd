extends Node2D


var starting 

onready var label = $Player/Score


func _ready():
	starting = $Player.get_global_position().y
	Global.world = self
	Global.levels_to_generate = 3
	Global.enemys = 1

func _process(_delta):
	Global.score = (abs($Player.get_global_position().y) - starting) / 10
	if Global.score > Global.highScore:
		Global.highScore = Global.score
		Global.new_highscore = true
		
	
	label.text = str(int(Global.score))
	
	Global.player_position = $Player.get_global_position()


func _exit_tree():
	Global.world = null


func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)


func instance_fase(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location
	$WordGenerator.altura_level = node_instance.altura
	print($WordGenerator.altura_level)
	


func end_game():
	Global.score_last_played = Global.score
	
	get_tree().change_scene("res://Scenes/End Game.tscn")
	
