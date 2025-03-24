shader_type canvas_item;
uniform float height = 2.0;
uniform float speed = 2.0;
void vertex() {
	VERTEX.y += height * sin(speed * TIME);
}

