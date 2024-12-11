extends Node2D

const BLOCK = preload("res://src/block/block.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_block(block_count):
	var n_block = BLOCK.instantiate()
	n_block.global_position.y = -1080 * (block_count + 2)
	add_child(n_block)
