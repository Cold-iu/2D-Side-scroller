extends CanvasLayer

var indicator_margin = Vector2(15,50)
var indicator_index = 25
var Indicator = load("res://indicator.tscn")

func _ready():
	update_score()
	update_time()
	update_lives()


func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_time():
	$Time.text = "Time: " + str(Global.time)

func update_lives():
	var indicator_pos = Vector2(indicator_margin.x,indicator_margin.y)
	for i in $Indicator_Container.get_children():
		i.queue_free()
	for i in range(Global.Health):
		var indicator = Indicator.instantiate()
		indicator.position = Vector2(indicator_pos.x + i*indicator_index, indicator_pos.y)
		indicator.modulate = Color8(randi_range(10,255),randi_range(10,255),randi_range(10,255),255)
		$Indicator_Container.add_child(indicator)
