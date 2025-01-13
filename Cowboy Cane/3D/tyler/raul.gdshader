shader_type spatial;

render_mode cull_disabled, diffuse_toon, specular_toon;

uniform sampler2D albedo_color : filter_nearest_mipmap;
uniform sampler2D aliasing_albedo : source_color;
uniform float roughness : hint_range(0.0, 1.0);


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {

	vec3 myalbedo =  texture(albedo_color, UV).rgb;
	vec3 blur = texture(aliasing_albedo, UV).rgb;

	vec3 blurred = mix(myalbedo, blur, 0.3);

	ALBEDO = blurred * blurred;

	ROUGHNESS = roughness;
}