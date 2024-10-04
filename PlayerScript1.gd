extends Sprite2D
var velocity = Vector2(0,0)
var colided = false
@export var speed = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta) -> void:
	if not colided:
		self.position += velocity
func _unhandled_input(event):
	if event is InputEventKey:
		if event.is_action_pressed("W"):
			velocity = Vector2(0,-speed)
		if event.is_action_pressed("S"):
			velocity = Vector2(0,speed)
		if event.is_action_released("W") and velocity != Vector2(0,speed):
			velocity = Vector2(0,0)
		if event.is_action_released("S") and velocity != Vector2(0,-speed):
			velocity = Vector2(0,0)
