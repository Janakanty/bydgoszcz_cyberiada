extends Control

func _ready() -> void:
	set_points(94562)

func set_points(points: int):
	$Points.text = str(points)
