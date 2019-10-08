varying mediump vec4 position;
varying highp vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 color;
uniform highp vec4 shader_scale;

void main()
{
	highp float pixel_width = 1.0 / shader_scale.x;
	lowp float pixel_height = 1.0 / shader_scale.y;

	float distance_to_border_x = var_texcoord0.x < 0.5 ? var_texcoord0.x * shader_scale.x : (1.0 - var_texcoord0.x) * shader_scale.x;
	float distance_to_border_y = var_texcoord0.y < 0.5 ? var_texcoord0.y * shader_scale.y : (1.0 - var_texcoord0.y) * shader_scale.y;
	float distance_to_border = min(distance_to_border_x, distance_to_border_y);

	const float outline_width = 30.0;
	float alpha = 0.0;
	if (distance_to_border < outline_width)
	{
		alpha = (outline_width - distance_to_border) / outline_width;
		alpha *= alpha;
		alpha *= color.w;
	}

	gl_FragColor = vec4(color.xyz * alpha, alpha);
}
