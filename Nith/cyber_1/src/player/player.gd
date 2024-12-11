extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $jump


func _physics_process(delta: float) -> void:
	gravity(delta)
	jumpin()
	move()
	
	# Add the gravity.
func gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
func jumpin():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump")
		audio_stream_player.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
func move():
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()