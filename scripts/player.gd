extends CharacterBody2D


const SPEED = 70.0
const JUMP_VELOCITY = -270.0
@onready var player: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		player.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		player.flip_h = false
	elif direction < 0:
		player.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			player.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		player.play("idle")

	move_and_slide()
