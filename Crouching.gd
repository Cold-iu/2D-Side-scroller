extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.set_animation("Crouch")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(_delta):
	if not player.is_on_floor():
		SM.set_state("Falling")
	if Input.is_action_pressed("Move_Left") or Input.is_action_pressed("Move_Right"):
		SM.set_state("Crouch_Walk")
	if Input.is_action_pressed("Jump"):
		SM.set_state("Jumping")

