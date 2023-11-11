extends Node

var Health = 3
var score = 0 
var time = 0
var VP = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func add_coin():
	Global.score += 1
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Menu"):
		get_tree().quit()

func _resize():
	VP = get_viewport().size

func reset():
	Health = 3
	score = 0
	time = 0

func update_score(s):
	score += s
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()

func update_lives(l):
	Health += l
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_lives()



func update_time(t):
	time += t
	var HUD = get_node_or_null("/root/Player/UI/HUD")
	if HUD != null:
		HUD.update_time()
