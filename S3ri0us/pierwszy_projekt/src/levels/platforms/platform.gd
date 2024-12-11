extends StaticBody2D

func platform_color_change():
	var animation = create_tween()
	animation.tween_property($ColorRect,"color",Color("0f7400"),0.5)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		platform_color_change()
