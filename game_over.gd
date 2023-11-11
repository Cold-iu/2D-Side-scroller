extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Final_Score.text = "Final Score:" + str(Global.score)
	$CanvasLayer/Lives_Left.text = "Lives left:" + str(Global.Health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
		get_tree().change_scene_to_file("res://main_menu.tscn")# Replace with function body.
