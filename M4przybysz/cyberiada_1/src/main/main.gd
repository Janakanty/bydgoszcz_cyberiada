extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Gameplay/Gameplay.connect("reload", reload_gameplay)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func reload_gameplay():
	$Gameplay/Gameplay.get_tree().reload_current_scene()
