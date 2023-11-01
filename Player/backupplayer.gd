extends CharacterBody2D

@onready var SM = $StateMachine

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

	
func get_input():
	var direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		if Input.is_action_pressed("Run"):
			velocity.x = direction * (SPEED * 1.3)
		else:
			velocity.x = direction * SPEED
			if direction < 0:
				$Sprite.flip_h = true
			else:
				$Sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("Crouch"):
		$Sprite.animation = "Crouch"
		#if Input.is_action_pressed("Move_Right") and Input.is_action_pressed("Crouch"):
		#	$Sprite.play("Crouch_Walk")
		

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sprite.play("Jumping")
	#if Input.is_action_just_pressed("Dodge_Roll") and is_on_floor():
		#$Sprite.animation = "Roll"
		
	move_and_slide()

func _physics_process(delta):
	# Add the gravity.
	if $State.text != SM.state_name:
		$State.text = SM.state_name
	
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite.animation = "Jumping"
	elif abs(velocity.x) > 0:
		$Sprite.play("Walking")
		
	else:
		$Sprite.play("Idle")

	get_input()

func set_animation(anim):
	if $Sprite.animation == anim: return
	if $Sprite.sprite_frames.has_animation(anim): $Sprite.play(anim)
	else: $Sprite.play()
