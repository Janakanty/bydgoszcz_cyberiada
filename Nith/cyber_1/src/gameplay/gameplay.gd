extends Node2D
var player_position:int
var state  ="under"

func _ready() -> void:
	$Camera2D.connect("dead", game_over)
	
func _process(delta: float) -> void:
	points_updt()
	camera_state("over")

func points_updt():
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)
	
func game_over():
	$UI/UI.game_over()
	print("game over")
	
func camera_state(state):
	if $Player.global_position.y - $Camera2D.global_position.y < 0:
		state = "over"
	else:
		state= "under"	
	match state:
		"over":
			$Camera2D.global_position.y = $Player.global_position.y
		"under":
			$Camera2D.global_position.y -= 1
			
			
