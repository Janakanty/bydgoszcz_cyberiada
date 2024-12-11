extends Camera2D
signal die

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("piwo")
		die.emit()
		
