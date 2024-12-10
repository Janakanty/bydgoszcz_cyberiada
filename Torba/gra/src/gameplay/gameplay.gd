extends Node2D

var player_position:int

func _process(delta: float) -> void:
	points_actualization()

func points_actualization() -> void:
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)
