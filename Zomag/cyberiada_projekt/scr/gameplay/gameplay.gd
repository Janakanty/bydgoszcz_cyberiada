extends Node2D

var player_position: int
var state: String = "under"
@onready var player: CharacterBody2D = $Player


func _ready() -> void:
	$Camera2D.connect("dead", game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points_actualization()
	$Camera2D.translate(Vector2(0,-1))
	camera_state()
	
func points_actualization() -> void:
	if player:
		player_position = player.global_position.y
		$UI/UI.set_points(-player_position)

func game_over():
	print("game over")
	$UI/UI.set_message("Game Over")
	player.set_process(false)
	player.set_physics_process(false)
	player.visible = false

func camera_state():
	#print("Pozycja playera:", $Player.global_position.y)
	#print("Pozycja kamery:", $Camera2D.global_position.y)
	if player:	
		if player.global_position.y - $Camera2D.global_position.y < 0:
			state = "over"
		else:
			state = "under"
	
		match state:
			"over":
				$Camera2D.global_position.y = player.global_position.y
			"under":
				pass
