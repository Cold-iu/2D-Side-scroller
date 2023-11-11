extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.set_animation("Attack")
	$Timer.start()

func end():
	player.get_node("Sprite").offset.y = 0

func physics_process(_delta):
	pass


func _on_Timer_timeout():
	if SM.state_name == "Attacking":
		player.attack()
