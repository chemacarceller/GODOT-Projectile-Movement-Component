shader_type spatial;
render_mode blend_mix,cull_back,diffuse_burley,specular_schlick_ggx
;
uniform vec3 uv1_offset = vec3(0.0, 0.0, 0.0);
uniform vec3 uv1_scale = vec3(1.0, 1.0, 1.0);
uniform int depth_min_layers = 8;
uniform int depth_max_layers = 16;
uniform vec2 depth_flip = vec2(1.0);
uniform float variation = 0.0;
varying float elapsed_time;
void vertex() {
	elapsed_time = TIME;
	UV = UV*uv1_scale.xy+uv1_offset.xy;
}
float dot2(vec2 x) {
	return dot(x, x);
}
float rand(vec2 x) {
    return fract(cos(mod(dot(x, vec2(13.9898, 8.141)), 3.14)) * 43758.5);
}
vec2 rand2(vec2 x) {
    return fract(cos(mod(vec2(dot(x, vec2(13.9898, 8.141)),
						      dot(x, vec2(3.4562, 17.398))), vec2(3.14))) * 43758.5);
}
vec3 rand3(vec2 x) {
    return fract(cos(mod(vec3(dot(x, vec2(13.9898, 8.141)),
							  dot(x, vec2(3.4562, 17.398)),
                              dot(x, vec2(13.254, 5.867))), vec3(3.14))) * 43758.5);
}
float param_rnd(float minimum, float maximum, float seed) {
	return minimum+(maximum-minimum)*rand(vec2(seed));
}
float param_rndi(float minimum, float maximum, float seed) {
	return floor(param_rnd(minimum, maximum + 1.0, seed));
}
vec3 rgb2hsv(vec3 c) {
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = c.g < c.b ? vec4(c.bg, K.wz) : vec4(c.gb, K.xy);
	vec4 q = c.r < p.x ? vec4(p.xyw, c.r) : vec4(c.r, p.yzx);
	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}
const vec4 p_o977222509610_albedo_color = vec4(1.000000000, 1.000000000, 1.000000000, 1.000000000);
const float p_o977222509610_metallic = 0.000000000;
const float p_o977222509610_roughness = 1.000000000;
const float p_o977222509610_emission_energy = 3.000000000;
const float p_o977222509610_normal = 1.000000000;
const float p_o977222509610_ao = 1.000000000;
const float p_o977222509610_depth_scale = 1.000000000;
const float p_o985426568503_translate_x = 0.250000000;
const float p_o985426568503_rotate = 0.000000000;
const float p_o985426568503_scale_x = 1.000000000;
const float p_o985426568503_scale_y = 1.000000000;
const float seed_o985460122933 = -57371.000000000;
const float p_o985460122933_scale_x = 1.000000000;
const float p_o985460122933_scale_y = 1.000000000;
const float p_o985460122933_folds = 0.000000000;
const float p_o985460122933_iterations = 3.000000000;
const float p_o985460122933_persistence = 0.500000000;
const float p_o985460122933_offset = 0.000000000;
uniform sampler2D texture_1;
const float texture_1_size = 1024.000000000;
const float p_o987607606535_amount = 1.000000000;
const float p_o987574052104_translate_x = 0.250000000;
const float p_o987574052104_rotate = 0.000000000;
const float p_o987574052104_scale_x = 1.000000000;
const float p_o987574052104_scale_y = 1.000000000;
const vec4 p_o987557274889_in_min = vec4(0.221295998, 0.221295998, 0.221295998, 0.000000000);
const vec4 p_o987557274889_in_mid = vec4(0.721296012, 0.721296012, 0.721296012, 0.500000000);
const vec4 p_o987557274889_in_max = vec4(1.000000000, 1.000000000, 1.000000000, 1.000000000);
const vec4 p_o987557274889_out_min = vec4(0.000000000, 0.000000000, 0.000000000, 0.000000000);
const vec4 p_o987557274889_out_max = vec4(1.000000000, 1.000000000, 1.000000000, 1.000000000);
const float p_o986315760924_gradient_pos[3] = float[]( 0.113747999, 0.233667001, 0.391878009 );
const vec4 p_o986315760924_gradient_col[3] = vec4[]( vec4(0.945312023, 0.825215995, 0.276946992, 1.000000000), vec4(0.820312023, 0.288841993, 0.201874003, 1.000000000), vec4(0.222655997, 0.152294993, 0.127853006, 1.000000000) );
const float p_o987641160964_brightness = 0.000000000;
const float p_o987641160964_contrast = 2.000000000;
const float p_o987624383749_rotate = 0.000000000;
const float p_o987624383749_scale_x = 1.000000000;
const float p_o987624383749_scale_y = 1.000000000;
const float seed_o987590829318 = 30434.000000000;
const float p_o987590829318_scale_x = 3.000000000;
const float p_o987590829318_scale_y = 3.000000000;
const float p_o987590829318_folds = 0.000000000;
const float p_o987590829318_iterations = 2.000000000;
const float p_o987590829318_persistence = 0.500000000;
const float p_o987590829318_offset = 0.000000000;
const float p_o985409791288_translate_x = 0.250000000;
const float p_o985409791288_rotate = 0.000000000;
const float p_o985409791288_scale_x = 1.000000000;
const float p_o985409791288_scale_y = 1.000000000;
const float p_o977407058997_amount = 1.000000000;
const float p_o985376236858_translate_x = 0.250000000;
const float p_o985376236858_rotate = 0.000000000;
const float p_o985376236858_scale_x = 1.000000000;
const float p_o985376236858_scale_y = 1.000000000;
const float p_o977256064044_amount = 0.300000000;
uniform sampler2D texture_4;
const float texture_4_size = 1024.000000000;
// #globals: transform2_3 (o985426568503)
vec2 transform2_clamp(vec2 uv) {
	return clamp(uv, vec2(0.0), vec2(1.0));
}
vec2 transform2(vec2 uv, vec2 translate, float rotate, vec2 scale) {
 	vec2 rv;
	uv -= translate;
	uv -= vec2(0.5);
	rv.x = cos(rotate)*uv.x + sin(rotate)*uv.y;
	rv.y = -sin(rotate)*uv.x + cos(rotate)*uv.y;
	rv /= scale;
	rv += vec2(0.5);
	return rv;	
}
// #globals: fbm2 (o985460122933)
float value_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float p00 = rand(mod(o, size));
	float p01 = rand(mod(o + vec2(0.0, 1.0), size));
	float p10 = rand(mod(o + vec2(1.0, 0.0), size));
	float p11 = rand(mod(o + vec2(1.0, 1.0), size));
	p00 = sin(p00 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	p01 = sin(p01 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	p10 = sin(p10 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	p11 = sin(p11 * 6.28318530718 + offset * 6.28318530718) / 2.0 + 0.5;
	vec2 t =  f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
	return mix(mix(p00, p10, t.x), mix(p01, p11, t.x), t.y);
}
float fbm_2d_value(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = value_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float perlin_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float a00 = rand(mod(o, size)) * 6.28318530718 + offset * 6.28318530718;
	float a01 = rand(mod(o + vec2(0.0, 1.0), size)) * 6.28318530718 + offset * 6.28318530718;
	float a10 = rand(mod(o + vec2(1.0, 0.0), size)) * 6.28318530718 + offset * 6.28318530718;
	float a11 = rand(mod(o + vec2(1.0, 1.0), size)) * 6.28318530718 + offset * 6.28318530718;
	vec2 v00 = vec2(cos(a00), sin(a00));
	vec2 v01 = vec2(cos(a01), sin(a01));
	vec2 v10 = vec2(cos(a10), sin(a10));
	vec2 v11 = vec2(cos(a11), sin(a11));
	float p00 = dot(v00, f);
	float p01 = dot(v01, f - vec2(0.0, 1.0));
	float p10 = dot(v10, f - vec2(1.0, 0.0));
	float p11 = dot(v11, f - vec2(1.0, 1.0));
	vec2 t =  f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
	return 0.5 + mix(mix(p00, p10, t.x), mix(p01, p11, t.x), t.y);
}
float fbm_2d_perlin(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = perlin_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float perlinabs_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	return abs(2.0*perlin_noise_2d(coord, size, offset, seed)-1.0);
}
float fbm_2d_perlinabs(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = perlinabs_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float fbm_2d_mod289(float x) {
	return x - floor(x * (1.0 / 289.0)) * 289.0;
}
float fbm_2d_permute(float x) {
	return fbm_2d_mod289(((x * 34.0) + 1.0) * x);
}
vec2 fbm_2d_rgrad2(vec2 p, float rot, float seed) {
	float u = fbm_2d_permute(fbm_2d_permute(p.x) + p.y) * 0.0243902439 + rot; // Rotate by shift
	u = fract(u) * 6.28318530718; // 2*pi
	return vec2(cos(u), sin(u));
}
float simplex_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	coord *= 2.0; // needed for it to tile
	coord += rand2(vec2(seed, 1.0-seed)) + size;
	size *= 2.0; // needed for it to tile
	coord.y += 0.001;
	vec2 uv = vec2(coord.x + coord.y*0.5, coord.y);
	vec2 i0 = floor(uv);
	vec2 f0 = fract(uv);
	vec2 i1 = (f0.x > f0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
	vec2 p0 = vec2(i0.x - i0.y * 0.5, i0.y);
	vec2 p1 = vec2(p0.x + i1.x - i1.y * 0.5, p0.y + i1.y);
	vec2 p2 = vec2(p0.x + 0.5, p0.y + 1.0);
	i1 = i0 + i1;
	vec2 i2 = i0 + vec2(1.0, 1.0);
	vec2 d0 = coord - p0;
	vec2 d1 = coord - p1;
	vec2 d2 = coord - p2;
	vec3 xw = mod(vec3(p0.x, p1.x, p2.x), size.x);
	vec3 yw = mod(vec3(p0.y, p1.y, p2.y), size.y);
	vec3 iuw = xw + 0.5 * yw;
	vec3 ivw = yw;
	vec2 g0 = fbm_2d_rgrad2(vec2(iuw.x, ivw.x), offset, seed);
	vec2 g1 = fbm_2d_rgrad2(vec2(iuw.y, ivw.y), offset, seed);
	vec2 g2 = fbm_2d_rgrad2(vec2(iuw.z, ivw.z), offset, seed);
	vec3 w = vec3(dot(g0, d0), dot(g1, d1), dot(g2, d2));
	vec3 t = 0.8 - vec3(dot(d0, d0), dot(d1, d1), dot(d2, d2));
	t = max(t, vec3(0.0));
	vec3 t2 = t * t;
	vec3 t4 = t2 * t2;
	float n = dot(t4, w);
	return 0.5 + 5.5 * n;
}
float fbm_2d_simplex(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = simplex_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float cellular_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node =  0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718 * node);
			vec2 diff = neighbor + node - f;
			float dist = length(diff);
			min_dist = min(min_dist, dist);
		}
	}
	return min_dist;
}
float fbm_2d_cellular(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = cellular_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float cellular2_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist1 = 2.0;
	float min_dist2 = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = length(diff);
			if (min_dist1 > dist) {
				min_dist2 = min_dist1;
				min_dist1 = dist;
			} else if (min_dist2 > dist) {
				min_dist2 = dist;
			}
		}
	}
	return min_dist2-min_dist1;
}
float fbm_2d_cellular2(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = cellular2_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float cellular3_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = abs((diff).x) + abs((diff).y);
			min_dist = min(min_dist, dist);
		}
	}
	return min_dist;
}
float fbm_2d_cellular3(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = cellular3_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float cellular4_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist1 = 2.0;
	float min_dist2 = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = abs((diff).x) + abs((diff).y);
			if (min_dist1 > dist) {
				min_dist2 = min_dist1;
				min_dist1 = dist;
			} else if (min_dist2 > dist) {
				min_dist2 = dist;
			}
		}
	}
	return min_dist2-min_dist1;
}
float fbm_2d_cellular4(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = cellular4_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float cellular5_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.5 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = max(abs((diff).x), abs((diff).y));
			min_dist = min(min_dist, dist);
		}
	}
	return min_dist;
}
float fbm_2d_cellular5(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = cellular5_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
float cellular6_noise_2d(vec2 coord, vec2 size, float offset, float seed) {
	vec2 o = floor(coord)+rand2(vec2(seed, 1.0-seed))+size;
	vec2 f = fract(coord);
	float min_dist1 = 2.0;
	float min_dist2 = 2.0;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 neighbor = vec2(float(x),float(y));
			vec2 node = rand2(mod(o + vec2(x, y), size)) + vec2(x, y);
			node = 0.5 + 0.25 * sin(offset * 6.28318530718 + 6.28318530718*node);
			vec2 diff = neighbor + node - f;
			float dist = max(abs((diff).x), abs((diff).y));
			if (min_dist1 > dist) {
				min_dist2 = min_dist1;
				min_dist1 = dist;
			} else if (min_dist2 > dist) {
				min_dist2 = dist;
			}
		}
	}
	return min_dist2-min_dist1;
}
float fbm_2d_cellular6(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = cellular6_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
// MIT License Inigo Quilez - https://www.shadertoy.com/view/Xd23Dh
float voronoise_noise_2d( vec2 coord, vec2 size, float offset, float seed) {
	vec2 i = floor(coord) + rand2(vec2(seed, 1.0-seed)) + size;
	vec2 f = fract(coord);
	
	vec2 a = vec2(0.0);
	
	for( int y=-2; y<=2; y++ ) {
		for( int x=-2; x<=2; x++ ) {
			vec2  g = vec2( float(x), float(y) );
			vec3  o = rand3( mod(i + g, size) + vec2(seed) );
			o.xy += 0.25 * sin(offset * 6.28318530718 + 6.28318530718*o.xy);
			vec2  d = g - f + o.xy;
			float w = pow( 1.0-smoothstep(0.0, 1.414, length(d)), 1.0 );
			a += vec2(o.z*w,w);
		}
	}
	
	return a.x/a.y;
}
float fbm_2d_voronoise(vec2 coord, vec2 size, int folds, int octaves, float persistence, float offset, float seed) {
	float normalize_factor = 0.0;
	float value = 0.0;
	float scale = 1.0;
	for (int i = 0; i < octaves; i++) {
		float noise = voronoise_noise_2d(coord*size, size, offset, seed);
		for (int f = 0; f < folds; ++f) {
			noise = abs(2.0*noise-1.0);
		}
		value += noise * scale;
		normalize_factor += scale;
		size *= 2.0;
		scale *= persistence;
	}
	return value / normalize_factor;
}
// #globals: invert (o977792934967)
// #globals: blend_6 (o987607606535)
vec3 blend_normal(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*c1 + (1.0-opacity)*c2;
}
vec3 blend_dissolve(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	if (rand(uv) < opacity) {
		return c1;
	} else {
		return c2;
	}
}
vec3 blend_multiply(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*c1*c2 + (1.0-opacity)*c2;
}
vec3 blend_screen(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*(1.0-(1.0-c1)*(1.0-c2)) + (1.0-opacity)*c2;
}
float blend_overlay_f(float c1, float c2) {
	return (c1 < 0.5) ? (2.0*c1*c2) : (1.0-2.0*(1.0-c1)*(1.0-c2));
}
vec3 blend_overlay(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_overlay_f(c1.x, c2.x), blend_overlay_f(c1.y, c2.y), blend_overlay_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}
vec3 blend_hard_light(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*0.5*(c1*c2+blend_overlay(uv, c1, c2, 1.0)) + (1.0-opacity)*c2;
}
float blend_soft_light_f(float c1, float c2) {
	return (c2 < 0.5) ? (2.0*c1*c2+c1*c1*(1.0-2.0*c2)) : 2.0*c1*(1.0-c2)+sqrt(c1)*(2.0*c2-1.0);
}
vec3 blend_soft_light(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_soft_light_f(c1.x, c2.x), blend_soft_light_f(c1.y, c2.y), blend_soft_light_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}
float blend_burn_f(float c1, float c2) {
	return (c1==0.0)?c1:max((1.0-((1.0-c2)/c1)),0.0);
}
vec3 blend_burn(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_burn_f(c1.x, c2.x), blend_burn_f(c1.y, c2.y), blend_burn_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}
float blend_dodge_f(float c1, float c2) {
	return (c1==1.0)?c1:min(c2/(1.0-c1),1.0);
}
vec3 blend_dodge(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*vec3(blend_dodge_f(c1.x, c2.x), blend_dodge_f(c1.y, c2.y), blend_dodge_f(c1.z, c2.z)) + (1.0-opacity)*c2;
}
vec3 blend_lighten(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*max(c1, c2) + (1.0-opacity)*c2;
}
vec3 blend_darken(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*min(c1, c2) + (1.0-opacity)*c2;
}
vec3 blend_difference(vec2 uv, vec3 c1, vec3 c2, float opacity) {
	return opacity*clamp(c2-c1, vec3(0.0), vec3(1.0)) + (1.0-opacity)*c2;
}
vec3 blend_additive(vec2 uv, vec3 c1, vec3 c2, float oppacity) {
	return c2 + c1 * oppacity;
}
vec3 blend_addsub(vec2 uv, vec3 c1, vec3 c2, float oppacity) {
	return c2 + (c1 - .5) * 2.0 * oppacity;
}
// #globals: tones_3 (o987557274889)
vec4 adjust_levels(vec4 color, vec4 in_min, vec4 in_mid, vec4 in_max, vec4 out_min, vec4 out_max) {
	color = clamp((color-in_min)/(in_max-in_min), 0.0, 1.0);
	in_mid = (in_mid-in_min)/(in_max-in_min);
	vec4 dark = step(in_mid, color);
	color = 0.5*mix(color/(in_mid), 1.0+(color-in_mid)/(1.0-in_mid), dark);
	return out_min+color*(out_max-out_min);
}
// #globals: normal_map/edge_detect_1 (o977407058997)
vec3 process_normal_default(vec3 v, float multiplier) {
	return 0.5*normalize(v.xyz*multiplier+vec3(0.0, 0.0, -1.0))+vec3(0.5);
}
vec3 process_normal_opengl(vec3 v, float multiplier) {
	return 0.5*normalize(v.xyz*multiplier+vec3(0.0, 0.0, 1.0))+vec3(0.5);
}
vec3 process_normal_directx(vec3 v, float multiplier) {
	return 0.5*normalize(v.xyz*vec3(1.0, -1.0, 1.0)*multiplier+vec3(0.0, 0.0, 1.0))+vec3(0.5);
}
float o977222509610_input_depth_tex(vec2 uv, float _seed_variation_) {
// #output0: fbm2 (o985460122933)
float o985460122933_0_1_f = fbm_2d_value((uv), vec2(p_o985460122933_scale_x, p_o985460122933_scale_y), int(p_o985460122933_folds), int(p_o985460122933_iterations), p_o985460122933_persistence, p_o985460122933_offset, (seed_o985460122933+fract(_seed_variation_)));
vec4 o977809712184_0 = textureLod(texture_1, fract((fract(transform2(uv, vec2(p_o985426568503_translate_x*(2.0*o985460122933_0_1_f-1.0), (elapsed_time*.05)*(2.0*1.0-1.0)), p_o985426568503_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o985426568503_scale_x*(2.0*1.0-1.0), p_o985426568503_scale_y*(2.0*1.0-1.0)))))), 0.0);
// #output0: invert (o977792934967)
vec4 o977792934967_0_1_rgba = vec4(vec3(1.0)-o977809712184_0.rgb, o977809712184_0.a);
// #output0: transform2_3 (o985426568503)
vec4 o985426568503_0_1_rgba = o977792934967_0_1_rgba;
return (dot((o985426568503_0_1_rgba).rgb, vec3(1.0))/3.0);
}
vec4 o986315760924_gradient_gradient_fct(float x) {
  if (x < p_o986315760924_gradient_pos[0]) {
    return p_o986315760924_gradient_col[0];
  } else if (x < p_o986315760924_gradient_pos[1]) {
    return mix(p_o986315760924_gradient_col[0], p_o986315760924_gradient_col[1], ((x-p_o986315760924_gradient_pos[0])/(p_o986315760924_gradient_pos[1]-p_o986315760924_gradient_pos[0])));
  } else if (x < p_o986315760924_gradient_pos[2]) {
    return mix(p_o986315760924_gradient_col[1], p_o986315760924_gradient_col[2], ((x-p_o986315760924_gradient_pos[1])/(p_o986315760924_gradient_pos[2]-p_o986315760924_gradient_pos[1])));
  }
  return p_o986315760924_gradient_col[2];
}
float o977407058997_input_in(vec2 uv, float _seed_variation_) {
vec4 o977809712184_0 = textureLod(texture_1, fract(uv), 0.0);
return (dot((o977809712184_0).rgb, vec3(1.0))/3.0);
}
// #instance: normal_map/edge_detect_1 (o977407058997)
vec3 o977407058997_fct(vec2 uv, float _seed_variation_) {
	vec3 e = vec3(1.0/1024.0, -1.0/1024.0, 0);
	vec2 rv = vec2(1.0, -1.0)*o977407058997_input_in((uv+e.xy), _seed_variation_);
	rv += vec2(-1.0, 1.0)*o977407058997_input_in((uv-e.xy), _seed_variation_);
	rv += vec2(1.0, 1.0)*o977407058997_input_in((uv+e.xx), _seed_variation_);
	rv += vec2(-1.0, -1.0)*o977407058997_input_in((uv-e.xx), _seed_variation_);
	rv += vec2(2.0, 0.0)*o977407058997_input_in((uv+e.xz), _seed_variation_);
	rv += vec2(-2.0, 0.0)*o977407058997_input_in((uv-e.xz), _seed_variation_);
	rv += vec2(0.0, 2.0)*o977407058997_input_in((uv+e.zx), _seed_variation_);
	rv += vec2(0.0, -2.0)*o977407058997_input_in((uv-e.zx), _seed_variation_);
	return vec3(rv, 0.0);
}
void fragment() {
	float _seed_variation_ = variation;
	vec2 uv = fract(UV);
	{

		float depth_scale = 0.2*p_o977222509610_depth_scale;

		vec3 view_dir = normalize(normalize(-VERTEX)*mat3(TANGENT*depth_flip.x,-BINORMAL*depth_flip.y,NORMAL));
		float num_layers = mix(float(depth_max_layers),float(depth_min_layers), abs(dot(vec3(0.0, 0.0, 1.0), view_dir)));
		float layer_depth = 1.0 / num_layers;
		float current_layer_depth = 0.0;
		vec2 P = view_dir.xy * depth_scale;
		vec2 delta = P / num_layers / dot(VIEW, NORMAL);
		vec2  ofs = uv;

		float depth = o977222509610_input_depth_tex((ofs), _seed_variation_);
		float current_depth = 0.0;
		while(current_depth < depth) {
			ofs -= delta;

			depth = o977222509610_input_depth_tex((ofs), _seed_variation_);
			current_depth += layer_depth;
		}
		vec2 prev_ofs = ofs + delta;
		float after_depth  = depth - current_depth;

		float before_depth = o977222509610_input_depth_tex((prev_ofs), _seed_variation_) - current_depth + layer_depth;
		float weight = after_depth / (after_depth - before_depth);
		ofs = mix(ofs, prev_ofs, weight);
		uv = ofs;
	}

// #output0: fbm2 (o985460122933)
float o985460122933_0_1_f = fbm_2d_value((uv), vec2(p_o985460122933_scale_x, p_o985460122933_scale_y), int(p_o985460122933_folds), int(p_o985460122933_iterations), p_o985460122933_persistence, p_o985460122933_offset, (seed_o985460122933+fract(_seed_variation_)));
vec4 o977809712184_0 = textureLod(texture_1, fract((fract(transform2((uv), vec2(p_o987574052104_translate_x*(2.0*o985460122933_0_1_f-1.0), (elapsed_time*.05)*(2.0*1.0-1.0)), p_o987574052104_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o987574052104_scale_x*(2.0*1.0-1.0), p_o987574052104_scale_y*(2.0*1.0-1.0)))))), 0.0);

// #output0: colorize (o986315760924)
vec4 o986315760924_0_1_rgba = o986315760924_gradient_gradient_fct((dot((o977809712184_0).rgb, vec3(1.0))/3.0));

// #output0: tones_3 (o987557274889)
vec4 o987557274889_0_1_rgba = adjust_levels(o986315760924_0_1_rgba, p_o987557274889_in_min, p_o987557274889_in_mid, p_o987557274889_in_max, p_o987557274889_out_min, p_o987557274889_out_max);

// #output0: transform2_5 (o987574052104)
vec4 o987574052104_0_1_rgba = o987557274889_0_1_rgba;

// #output0: fbm2_4 (o987590829318)
float o987590829318_0_1_f = fbm_2d_perlin((fract(transform2((uv), vec2((elapsed_time*.05)*(2.0*1.0-1.0), (elapsed_time*.01)*(2.0*1.0-1.0)), p_o987624383749_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o987624383749_scale_x*(2.0*1.0-1.0), p_o987624383749_scale_y*(2.0*1.0-1.0))))), vec2(p_o987590829318_scale_x, p_o987590829318_scale_y), int(p_o987590829318_folds), int(p_o987590829318_iterations), p_o987590829318_persistence, p_o987590829318_offset, (seed_o987590829318+fract(_seed_variation_)));

// #output0: transform2_6 (o987624383749)
vec4 o987624383749_0_1_rgba = vec4(vec3(o987590829318_0_1_f), 1.0);

// #output0: brightness_contrast (o987641160964)
vec4 o987641160964_0_1_rgba = vec4(clamp(o987624383749_0_1_rgba.rgb*p_o987641160964_contrast+vec3(p_o987641160964_brightness)+0.5-p_o987641160964_contrast*0.5, vec3(0.0), vec3(1.0)), o987624383749_0_1_rgba.a);

// #code: blend_6 (o987607606535)
vec4 o987607606535_0_s1 = o987641160964_0_1_rgba;
vec4 o987607606535_0_s2 = o987574052104_0_1_rgba;
float o987607606535_0_a = p_o987607606535_amount*1.0;
// #output0: blend_6 (o987607606535)
vec4 o987607606535_0_1_rgba = vec4(blend_multiply((uv), o987607606535_0_s1.rgb, o987607606535_0_s2.rgb, o987607606535_0_a*o987607606535_0_s1.a), min(1.0, o987607606535_0_s2.a+o987607606535_0_a*o987607606535_0_s1.a));

// #output0: normal_map/edge_detect_1 (o977407058997)
vec3 o977407058997_0_1_rgb = process_normal_default(o977407058997_fct((fract(transform2((uv), vec2(p_o985409791288_translate_x*(2.0*o985460122933_0_1_f-1.0), (elapsed_time*.05)*(2.0*1.0-1.0)), p_o985409791288_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o985409791288_scale_x*(2.0*1.0-1.0), p_o985409791288_scale_y*(2.0*1.0-1.0))))), _seed_variation_), p_o977407058997_amount*1024.0/128.0);

// #output0: transform2_2 (o985409791288)
vec4 o985409791288_0_1_rgba = vec4(o977407058997_0_1_rgb, 1.0);
vec4 o977809712184_1 = textureLod(texture_1, fract((fract(transform2((uv), vec2(p_o985376236858_translate_x*(2.0*o985460122933_0_1_f-1.0), (elapsed_time*.05)*(2.0*1.0-1.0)), p_o985376236858_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o985376236858_scale_x*(2.0*1.0-1.0), p_o985376236858_scale_y*(2.0*1.0-1.0)))))), 0.0);

// #output0: colorize (o986315760924)
vec4 o986315760924_0_3_rgba = o986315760924_gradient_gradient_fct((dot((o977809712184_1).rgb, vec3(1.0))/3.0));
float o986785522958_0 = textureLod(texture_4, fract((fract(transform2((uv), vec2(p_o985376236858_translate_x*(2.0*o985460122933_0_1_f-1.0), (elapsed_time*.05)*(2.0*1.0-1.0)), p_o985376236858_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o985376236858_scale_x*(2.0*1.0-1.0), p_o985376236858_scale_y*(2.0*1.0-1.0)))))), 0.0).r;

// #code: blend (o977256064044)
vec4 o977256064044_0_s1 = vec4(vec3(o986785522958_0), 1.0);
vec4 o977256064044_0_s2 = o986315760924_0_3_rgba;
float o977256064044_0_a = p_o977256064044_amount*1.0;
// #output0: blend (o977256064044)
vec4 o977256064044_0_1_rgba = vec4(blend_overlay((fract(transform2((uv), vec2(p_o985376236858_translate_x*(2.0*o985460122933_0_1_f-1.0), (elapsed_time*.05)*(2.0*1.0-1.0)), p_o985376236858_rotate*0.01745329251*(2.0*1.0-1.0), vec2(p_o985376236858_scale_x*(2.0*1.0-1.0), p_o985376236858_scale_y*(2.0*1.0-1.0))))), o977256064044_0_s1.rgb, o977256064044_0_s2.rgb, o977256064044_0_a*o977256064044_0_s1.a), min(1.0, o977256064044_0_s2.a+o977256064044_0_a*o977256064044_0_s1.a));

// #output0: transform2 (o985376236858)
vec4 o985376236858_0_1_rgba = o977256064044_0_1_rgba;

	vec3 albedo_tex = ((o985376236858_0_1_rgba).rgb).rgb;
	albedo_tex = mix(pow((albedo_tex + vec3(0.055)) * (1.0 / (1.0 + 0.055)),vec3(2.4)),albedo_tex * (1.0 / 12.92),lessThan(albedo_tex,vec3(0.04045)));
	ALBEDO = albedo_tex*p_o977222509610_albedo_color.rgb;
	METALLIC = 1.0*p_o977222509610_metallic;
	ROUGHNESS = 1.0*p_o977222509610_roughness;
	NORMAL = ((o985409791288_0_1_rgba).rgb);
	EMISSION = ((o987607606535_0_1_rgba).rgb)*p_o977222509610_emission_energy;
}



