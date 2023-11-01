extends Node2D

@onready var Player = load("res://game.tscn")
var starting_position = Vector2(15,520)


func _physics_process(_delta):
	if not has_node("Player"):
		var player = Player.instantiate()
		player.position = starting_position
		add_child(player)
