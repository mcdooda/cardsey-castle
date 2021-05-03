varying mediump vec4 position;
varying highp vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 dissolve_progression;

// Noise function by Inigo Quilez: https://www.shadertoy.com/view/Msf3WH
vec2 hash(vec2 p)
{
	p = vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3)));
	return -1.0 + 2.0 * fract(sin(p) * 43758.5453123);
}

float noise( in vec2 p )
{
	const float K1 = 0.366025404;
	const float K2 = 0.211324865;

	vec2  i = floor(p + (p.x + p.y) * K1);
	vec2  a = p - i + (i.x + i.y) * K2;
	float m = step(a.y, a.x); 
	vec2  o = vec2(m, 1.0 - m);
	vec2  b = a - o + K2;
	vec2  c = a - 1.0 + 2.0 * K2;
	vec3  h = max(0.5 - vec3(dot(a, a), dot(b, b), dot(c, c)), 0.0);
	vec3  n = h * h * h * h * vec3(dot(a, hash(i + 0.0)), dot(b, hash(i + o)), dot(c,hash(i + 1.0)));
	return dot(n, vec3(70.0));
}

void main()
{
	vec4 color = texture2D(texture_sampler, var_texcoord0.xy);
	float alpha = color.a;
	alpha = min(alpha, 2.0 + noise(var_texcoord0.xy * 15.0) - dissolve_progression.x * 3.0);
	gl_FragColor = vec4(color.rgb * alpha, alpha);
}
