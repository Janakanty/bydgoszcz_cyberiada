extends Control


func _ready():
	set_points(1000)

func set_points(points: int):
	$Points.text = str(points)

func game_over():
	$GameOver.visible = true
