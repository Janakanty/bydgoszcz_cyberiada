extends Node2D
var player_position:int

func _ready() -> void:
	$Camera2D.connect("dead", game_over)
	
func _process(delta: float) -> void:
	points_updt()

func points_updt():
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)
	
func game_over():
	$UI/UI.game_over()
	print("game over")
	
func camera_state(state):
	match state:
		"over":
			pass
		"under":
			pass
			
			
