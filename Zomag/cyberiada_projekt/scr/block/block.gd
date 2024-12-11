extends Node2D

const BLOCK_SCENE = preload("res://scr/block/block.tscn")

#BUG: When created, the player could fall a little, causing some empty spaces between blocks,
# or some block are created, but never entered, so they would never be freed when player falls.
func _on_render_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var block = BLOCK_SCENE.instantiate()
		block.global_position.y = global_position.y - 653
		#get_parent().add_child(block)
		get_parent().call_deferred("add_child",block)

func _on_render_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
