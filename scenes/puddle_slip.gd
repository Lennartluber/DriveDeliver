extends Area2D

var player : CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")



func _on_body_entered(body: Node2D) -> void:
	player.controlling= false
	#get_tree().reload_current_scene()


func _on_body_exited(body: Node2D) -> void:
	player.controlling = true
