extends Control


func _ready():
	pass # Replace with function body.




func _on_PLay_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Credito_pressed():
	get_tree().change_scene("res://Scenes/Creditos.tscn")