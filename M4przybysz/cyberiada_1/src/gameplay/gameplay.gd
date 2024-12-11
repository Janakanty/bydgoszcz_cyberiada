extends Node2D

signal reload

var player_position: int
var camera_state: String = "under"

func _ready():
	$Camera.connect("dead", game_over)
	$GameOverTimer.connect("timeout", reload.emit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points_update()
	if $Player.global_position.y - $Camera.global_position.y < 0:
		camera_state = "over"
	else:
		camera_state = "under"
	camera_movement()

func points_update():
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)

func game_over():
	print("game over")
	$UI/UI.game_over()
	$GameOverTimer.start()

func camera_movement() -> void:
	if $Player.global_position.y - $Camera.global_position.y < 0:
		camera_state = "over"
	else:
		camera_state = "under"
	
	match camera_state:
		"over":
			$Camera.global_position.y = $Player.global_position.y
		"under":
			$Camera.global_position.y -= 1
