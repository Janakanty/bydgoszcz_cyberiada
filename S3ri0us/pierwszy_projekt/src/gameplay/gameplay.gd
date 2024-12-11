extends Node2D

var player_position :int
var score :int = 0
var state :String = "under"
@onready var player: CharacterBody2D = $Player
@onready var camera: Camera2D = $Camera2D


signal game_over_signal 

func _ready() -> void:
	camera.connect("dead",game_over)

func _process(delta: float) -> void:
	points_update()
	camera_state()

func points_update():
	player_position = $Player.global_position.y
	if score < (-player_position):
		score = (-player_position)
	$UI/UI.set_points(score)


func game_over():
	#print("hehehue")
	$UI/UI.game_over()
	game_over_signal.emit()
	#$Player.queue_free()

func camera_state():
	if player.global_position.y - camera.global_position.y < 0:
		state = "over" 
	else :
		state = "under"
	
	match state:
		"over":
			camera.global_position.y = player.global_position.y
		"under":
			camera.global_position.y -= 1
