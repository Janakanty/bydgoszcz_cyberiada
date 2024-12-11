extends Control
var bonus_points: int = 0
func _ready() -> void:
	set_points(0000)
	
func set_points(points: int):
	$Points.text = str(points + bonus_points) 
