extends Control

func _ready() -> void:
	set_points(0)

func set_points(points:int):
	$points.text = str(points)

func game_over():
	$gameover.visible = true
