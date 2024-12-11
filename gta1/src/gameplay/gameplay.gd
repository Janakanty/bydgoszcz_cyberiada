extends Node2D

var player_possition:int

func _ready() -> void:
	$Camera2D.connect("die", game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points_actualization()
	camera_state()

func points_actualization():
	player_possition = -$Player.global_position.y
	$UI/UI.set_points(player_possition)
	
func game_over():
	print("game over")

func camera_state() -> void:
	var state = "over"
	
	match state:
		"over":
			$Camera2D.global_position.y = $Player.global_position.y
		"under":
			pass
