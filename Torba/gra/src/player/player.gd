extends CharacterBody2D


const SPEED = 600.0
var JUMP_VELOCITY = -1000.0
var gravityty = Vector2(0,1500)

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var jump: AudioStreamPlayer = $Jump


func _physics_process(delta: float) -> void:
	gravity(delta)
	jumping()
	moving()

func gravity(delta):
	if not is_on_floor():
		velocity += gravityty * delta

func jumping():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("jump")
		jump.play()

func moving():
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		JUMP_VELOCITY = -2000
		gravityty = Vector2(0,600)
		$Timer.stop()
		$Timer.start()

func _on_timer_timeout() -> void:
	JUMP_VELOCITY = -1000
	gravityty = Vector2(0,1500)
