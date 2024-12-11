extends Area2D

signal collected  # Sygnał informujący o zebraniu bonusu


func _on_body_entered(body):
	if body.name == "Player":  # Sprawdź, czy obiekt to gracz
		emit_signal("collected")  # Wyemituj sygnał zebrany bonus
		queue_free()  # Usuń bonus
