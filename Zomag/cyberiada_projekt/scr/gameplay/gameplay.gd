extends Node2D

var player_position: int
var state: String = "under"

func _ready() -> void:
	$Camera2D.connect("dead", game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points_actualization()
	camera_state("over")
	
func points_actualization() -> void:
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)

func game_over():
	print("game over")
	$UI/UI.set_message("Game Over")

func camera_state(state):
	print("Pozycja playera:", $Player.global_position.y)
	print("Pozycja kamery:", $Camera2D.global_position.y)
	
	if $Player.global_position.y - $Camera2D.global_position.y < 0:
		state = "over"
	else:
		state = "under"
	
	match state:
		"over":
			$Camera2D.global_position.y = $Player.global_position.y
		"under":
			pass
