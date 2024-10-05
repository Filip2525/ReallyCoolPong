extends Sprite2D

var colided = false
@export var speed = 3
@export var up_key: String
@export var down_key: String

func _process(delta) -> void:
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed(up_key):
		velocity = Vector2(0,-speed)
	if Input.is_action_pressed(down_key):
		velocity = Vector2(0, speed)
	
	if not colided:
		self.position += velocity*delta*60

	
