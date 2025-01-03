shader_type spatial;
render_mode cull_disabled;

uniform sampler2D myalbedo : filter_nearest_mipmap;
uniform sampler2D myshadow : filter_nearest_mipmap;
uniform sampler2D myspecular : filter_nearest_mipmap;
uniform sampler2D myshadowmask : filter_nearest_mipmap;
uniform sampler2D myspecularmask : filter_nearest_mipmap;

uniform float light_angle = 0.0;

void fragment() {
	vec3 mshadow = textureLod(myshadow, UV, 0.0).rgb;
	vec3 malbedo = textureLod(myalbedo, UV, 0.0).rgb;
	vec3 shadowmask = textureLod(myshadowmask, UV, 0.0).rgb;
	vec3 mspecular = textureLod(myspecular, UV, 0.0).rgb;
	vec3 specularmask = textureLod(myspecularmask, UV, 0.0).rgb;
	
	vec3 malbedo2 = mix(malbedo, mshadow, shadowmask);
	vec3 malbedo3 = mix(malbedo2, mspecular, specularmask);
	
	malbedo3 = malbedo3 * malbedo3;
	
	ALBEDO = malbedo3;
}
