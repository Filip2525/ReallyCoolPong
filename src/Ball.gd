extends CharacterBody2D

@onready var top_bottom = $"../WallColliders"
@onready var player1 = $"../Player1/CharacterBody2D"
@onready var player2 = $"../Player2/CharacterBody2D"
@onready var reset_timer = $ResetTimer

var direction
var speed = 600

func randomize_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	direction = direction.normalized()

func _ready() -> void:
	randomize()
	randomize_direction()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		if collision.get_collider() == top_bottom:
			direction.y = -direction.y
		if collision.get_collider() == player1:
			if player1.is_on_ceiling() or player1.is_on_floor():
				direction.y = -direction.y
			else:
				direction.x = 1
				if direction.y < 0:
					direction.y = remap(abs(player1.global_position.y - global_position.y), 0, 70, 0, 0.8)
					direction.y = -direction.y
				else:
					direction.y = remap(abs(player1.global_position.y - global_position.y), 0, 70, 0, 0.8)
				direction = direction.normalized()
		if collision.get_collider() == player2:
			if player2.is_on_ceiling() or player2.is_on_floor():
				direction.y = -direction.y
			else:
				direction.x = -1
				if direction.y < 0:
					direction.y = remap(abs(player2.global_position.y - global_position.y), 0, 70, 0, 0.8)
					direction.y = -direction.y
				else:
					direction.y = remap(abs(player2.global_position.y - global_position.y), 0, 70, 0, 0.8)
				direction = direction.normalized()
	
	if global_position.x < -20:
		direction = Vector2(0, 0)
		global_position = Vector2(640, 360)
		reset_timer.start()
		#
		# PLAYER 2 GETS A POINT
		#
	if global_position.x > 1290:
		direction = Vector2(0, 0)
		global_position = Vector2(640, 360)
		reset_timer.start()
		#
		# PLAYER 1 GETS A POINT
		#

func _on_reset_timer_timeout() -> void:
	randomize_direction()
