extends Control

func _ready() -> void:
	set_points(0000)
	
func set_points(points: int):
	$Points.text = str(points) 
