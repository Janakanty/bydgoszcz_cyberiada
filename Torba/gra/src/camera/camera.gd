extends Camera2D

signal dead

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		dead.emit()
		
