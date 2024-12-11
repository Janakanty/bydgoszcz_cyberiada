extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Gamplay/Gameplay.connect("game_over_signal",restart)
	$Gamplay/Gameplay/Player.connect("distance_reached",move_level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func restart():
	await(get_tree().create_timer(3).timeout)
	get_tree().reload_current_scene()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func move_level():
	$Gamplay/Gameplay/Level.global_position.y -= 500
