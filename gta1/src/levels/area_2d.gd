extends Node2D

signal collected

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("cam")
		queue_free()
