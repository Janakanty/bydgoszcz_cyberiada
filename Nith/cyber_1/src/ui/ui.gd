extends Control

func _ready() -> void:
	set_points(123456789)
func set_points(points):
	$Points.text = str(points)

func game_over():
	$game_over.visible = true
