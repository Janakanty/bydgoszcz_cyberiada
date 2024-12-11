extends Node2D

const BONUS = preload("res://src/Bonus/bonus.tscn")
var player_possition:int
var state = "over"

func _ready() -> void:
	$Camera2D.connect("die", game_over)
	$Bonus.connect("collected",add_points)
	random_bonus()
	random_bonus()
	random_bonus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points_actualization()
	camera_state()

func points_actualization():
	player_possition = -$Player.global_position.y
	$UI/UI.set_points(player_possition)
	
func game_over():
	print("game over")

func camera_state() -> void:
	if $Player.global_position.y - $Camera2D.global_position.y < 0:
		state = "over"
	else:
		state = "under"
	
	match state:
		"over":
			$Camera2D.global_position.y = $Player.global_position.y
		"under":
			$Camera2D.global_position.y -= 1

func add_points():
	$UI/UI.bonus_points = $UI/UI.bonus_points + 1000000
	print("Bonus Points")
	
func random_bonus():
	var b = BONUS.instantiate()
	b.global_position.x = randi_range(0,1100)
	b.global_position.y = randi_range(-1200,0)
	add_child(b)
	
