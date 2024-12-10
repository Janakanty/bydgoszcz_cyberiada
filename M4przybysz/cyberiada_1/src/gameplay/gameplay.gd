extends Node2D


var player_position: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points_update()


func points_update():
	player_position = -$Player.global_position.y
	$UI/UI.set_points(player_position)
