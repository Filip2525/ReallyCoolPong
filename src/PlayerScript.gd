extends CharacterBody2D

@export var speed = 15
@export var up_key: String
@export var down_key: String

func _process(delta) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed(up_key):
		velocity = Vector2(0,-speed)
	if Input.is_action_pressed(down_key):
		velocity = Vector2(0, speed)
	
	move_and_collide(velocity*delta*speed)

	
