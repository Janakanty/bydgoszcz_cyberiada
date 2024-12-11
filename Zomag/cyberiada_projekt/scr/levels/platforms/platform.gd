extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		platform_color_change()

func platform_color_change():
	var animation = create_tween()
	animation.tween_property($ColorRect,"color",Color("00c7e4"),0.5).set_trans(Tween.TRANS_BOUNCE)
