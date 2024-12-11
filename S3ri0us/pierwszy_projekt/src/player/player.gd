extends CharacterBody2D

const SPEED = 300.0
var JUMP_VELOCITY = -1000.0
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var jump_sound: AudioStreamPlayer2D = $jump
var wall_boost :bool = false
var distance :int = 0
var checkingpoint :int = 0
var check :bool = false

signal  distance_reached

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("jump")
		jump_sound.play()
	
	#print(str(distance)+", "+ str(check) + ", " + str(checkingpoint))
	if check == false:
		checkingpoint = abs(global_position.y)
		check = true

	if check == true:
		if checkingpoint <= abs(global_position.y):
			distance = abs(global_position.y) - checkingpoint
		if distance >= 500:
			distance_reached.emit()
			distance = 0
			check = false
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		velocity.y = JUMP_VELOCITY
		if !wall_boost:
			wall_boost = true
			JUMP_VELOCITY = 2*JUMP_VELOCITY
			await(get_tree().create_timer(2).timeout)
			JUMP_VELOCITY = JUMP_VELOCITY/2
			wall_boost = false
		
