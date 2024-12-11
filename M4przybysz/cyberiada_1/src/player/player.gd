extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -1000.0
var speed_multiplier = 1

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var jump: AudioStreamPlayer = $Jump

func _physics_process(delta: float) -> void:
	gravity(delta)
	jumping()
	movement()
	
func gravity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

func jumping():
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump")
		jump.play()

func movement():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if is_on_floor() && global_position.y > 0:
		speed_multiplier = 1.5 + -global_position.y / 2160
	else:
		speed_multiplier = 1 + -global_position.y / 2160
	
	if direction:
		velocity.x = direction * SPEED * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * speed_multiplier)

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		JUMP_VELOCITY = -2000
		velocity = Vector2(0, -750)
		$Fire.visible = true
		$Timer.stop()
		$Timer.start()

func _on_timer_timeout() -> void:
	JUMP_VELOCITY = -1000
	$Fire.visible = false
