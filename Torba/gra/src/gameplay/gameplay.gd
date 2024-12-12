extends Node2D

var player_position:int
var state: String = "under"

func _ready() -> void:
	$Camera2D.connect("dead", game_over)
	
func _process(delta: float) -> void:
	points_actualization()
	camera_state()

func points_actualization() -> void:
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)

func game_over() -> void:
	print("game over")

func camera_state() -> void:
	if $Player.global_position.y - $Camera2D.global_position.y < 0: 
		state = "over"
	else: 
		state = "under"
		
	match state:
		"over":
			$Camera2D.global_position.y = $Player.global_position.y
		"under":
			$Camera2D.global_position.y -= 1
			
