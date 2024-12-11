extends Control

func _ready() -> void:
	set_points(94562)

func set_points(points: int):
	$Points.text = str(points)
	
func set_message(message: String):
	$GameOverMessage.text = message
