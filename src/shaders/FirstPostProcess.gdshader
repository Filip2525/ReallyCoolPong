shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;

void fragment() {
	vec2 CENTER = vec2(0.5, 0.5);
	vec2 uv = SCREEN_UV.xy;

	vec2 dist = uv - CENTER;
	dist *= 1.0+0.8*pow(abs(dist.yx), vec2(2.5));

	uv = CENTER + dist;

	if (uv.x > 1.0 || uv.x < 0.0 || uv.y > 1.0 || uv.y < 0.0) {
		COLOR = vec4(0.0, 0.0, 0.0, 1.0);
	} else {
		COLOR = texture(screen_texture, uv);
	}
}
