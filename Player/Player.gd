extends CharacterBody2D

@onready var SM = $StateMachine


const SPEED = 300.0
const JUMP_VELOCITY = -50.0
const MAX_JUMP = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1

func _ready():
	up_direction = Vector2.UP

func _physics_process(_delta):
	if direction < 0 and not $Sprite.flip_h: $Sprite.flip_h = true
	if direction > 0 and $Sprite.flip_h: $Sprite.flip_h = false
	
	if $State.text != SM.state_name:
		$State.text = SM.state_name

func attack():
	if $Attack.is_colliding():
		var target = $Attack.get_collider()
		print(target)
		if target.has_method("damage"):
			target.damage()

func set_direction(d):
	direction = d
	
			
func set_animation(anim):
	if $Sprite.animation == anim: return
	if $Sprite.sprite_frames.has_animation(anim): $Sprite.play(anim)
	else: $Sprite.play()

func respawn():
	get_tree().reload_current_scene()

func die():
	Global.Health -= 1
	if Global.Health < 0:
		queue_free()
	else:
		respawn()


func _on_sprite_animation_finished():
		SM.set_state("Idle") # Replace with function body.



func _on_coin_collector_area_entered(body):
	if body.name == "Coin":
		Global.add_coin()
