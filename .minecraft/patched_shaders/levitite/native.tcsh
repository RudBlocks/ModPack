#version 410 core
#extension GL_ARB_tessellation_shader : require
#define SHADER_FEATURE_COMPUTE 1
#define TESSELLATION_SHADER 1
#define SHADER_FEATURE_TESSELLATION 1
#define SHADER_FEATURE_VERTEX_ATTRIBUTE64 1
#define SHADER_FEATURE_BINDLESS_TEXTURE 1
#define SHADER_FEATURE_CUBE_MAP_ARRAY 1
#define SHADER_FEATURE_FLOAT64 1
#define SHADER_FEATURE_SHADER_STORAGE 1
#define SHADER_FEATURE_INT64 1
#define SHADER_FEATURE_ATOMIC_COUNTER 1
layout(vertices = 4) out ;
in vec2 texCoord0[];
in vec4 vertexColor[];
in float vertexDistance[];
out vec2 texCoord0_out[];
out vec4 vertexColor_out[];
out float vertexDistance_out[];
void main(void) {
	if(gl_InvocationID == 0) {
		gl_TessLevelInner[0] = 4;
		gl_TessLevelInner[1] = 4;
		gl_TessLevelOuter[0] = 4;
		gl_TessLevelOuter[1] = 4;
		gl_TessLevelOuter[2] = 4;
		gl_TessLevelOuter[3] = 4;
	}
	gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;
	texCoord0_out[gl_InvocationID] = texCoord0[gl_InvocationID];
	vertexColor_out[gl_InvocationID] = vertexColor[gl_InvocationID];
	vertexDistance_out[gl_InvocationID] = vertexDistance[gl_InvocationID];
}
