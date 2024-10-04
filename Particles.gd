extends Node
@export var color = Color.AQUA
@export var active = true
@export var particle_texture: Texture2D
var particles = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if active:
		var particle = Sprite2D.new()
		var scale = randi()%20 / 1000.0
		particle.rotation_degrees = randi() % 181
		particle.texture = particle_texture
		particle.scale = Vector2(scale,scale)
		particles.append(particle)
		for sprite in particles:
			sprite.position += Vector2(1,1).rotated(sprite.rotation).normalized()
			sprite.scale /= 2
			if sprite.scale < Vector2(0.0001,0.0001):
				particles.remove_at(particles.find(sprite))
