extends CharacterBody2D


const  SPEED = 300.0
var JUMP_VELOCITY = -600.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $jump
var gravitation = Vector2(0,1200)
var zium = 1


func _physics_process(delta: float) -> void:
	gravity(delta)
	jumpin()
	move()
	ziummers()
	
	# Add the gravity.
func gravity(delta):
	if not is_on_floor():
		velocity += gravitation * delta

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
		velocity.x = direction * SPEED * zium
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func ziummers():
	if is_on_floor():
		zium = 2
	else:
		zium = 1
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		JUMP_VELOCITY = -1500
		$Timer.start()
		$Timer.stop()
func _on_timer_timeout() -> void:
	JUMP_VELOCITY = -1000
