#if !defined(MERLINVERTEXTRIX_INCLUDED)
#define MERLINVERTEXTRIX_INCLUDED

// Rotations High precision
float2x2 GetVertRotationMatrix_hp(float4 vertex, float degrees)
{
	float angle = degrees * 3.14 / 180.0;
	float sina, cosa;
	sincos(angle, sina, cosa);
	return float2x2(cosa, -sina, sina, cosa);
}

float4 RotateVertsXdeg_hp(float4 vertex, float degrees)
{
	float2x2 m = GetVertRotationMatrix_hp(vertex, degrees);
	return float4(mul(m, vertex.xy), vertex.zw).zxyw;
}

float4 RotateVertsYdeg_hp(float4 vertex, float degrees)
{
	float2x2 m = GetVertRotationMatrix_hp(vertex, degrees);
	return float4(mul(m, vertex.xz), vertex.yw).xzyw;
}

float4 RotateVertsZdeg_hp(float4 vertex, float degrees)
{
	float2x2 m = GetVertRotationMatrix_hp(vertex, degrees);
	return float4(mul(m, vertex.xy), vertex.zw).xyzw;
}

float4 RotateVertsAllAxisDeg_hp(float4 vertex, float degX, float degY, float degZ) 
{
    float4 processedVertex = vertex;
    processedVertex = RotateVertsXdeg_hp(processedVertex, degX);
    processedVertex = RotateVertsXdeg_hp(processedVertex, degY);
    processedVertex = RotateVertsXdeg_hp(processedVertex, degZ);
    
    return processedVertex;
}

// Rotations Mid precision
half2x2 GetVertRotationMatrix_mp(half4 vertex, half degrees)
{
	half angle = degrees * 3.14 / 180.0;
	half sina, cosa;
	sincos(angle, sina, cosa);
	return half2x2(cosa, -sina, sina, cosa);
}

half4 RotateVertsXdeg_mp(half4 vertex, half degrees)
{
	half2x2 m = GetVertRotationMatrix_mp(vertex, degrees);
	return half4(mul(m, vertex.xy), vertex.zw).zxyw;
}

half4 RotateVertsYdeg_mp(half4 vertex, half degrees)
{
	half2x2 m = GetVertRotationMatrix_mp(vertex, degrees);
	return half4(mul(m, vertex.xz), vertex.yw).xzyw;
}

half4 RotateVertsZdeg_mp(half4 vertex, half degrees)
{
	half2x2 m = GetVertRotationMatrix_mp(vertex, degrees);
	return half4(mul(m, vertex.xy), vertex.zw).xyzw;
}

half4 RotateVertsAllAxisDeg_mp(half4 vertex, half degX, half degY, half degZ) 
{
    float4 processedVertex = vertex;
    processedVertex = RotateVertsXdeg_hp(processedVertex, degX);
    processedVertex = RotateVertsXdeg_hp(processedVertex, degY);
    processedVertex = RotateVertsXdeg_hp(processedVertex, degZ);
    
    return processedVertex;
}

// Sin High precision
float3 SinVert_hp(float3 vertex, float3 axisMask, float frequency, float amplitude)
{
	float3 maskedFrequency = axisMask * frequency;
	float3 maskedAmpliutude = axisMask * amplitude;
	return sin(vertex * maskedFrequency + _Time.y) * maskedAmpliutude;
}

// Sin Mid precision
half3 SinVert_mp(half3 vertex, half3 axisMask, half frequency, half amplitude)
{
	half3 maskedFrequency = axisMask * frequency;
	half3 maskedAmpliutude = axisMask * amplitude;
	return sin(vertex * maskedFrequency + _Time.y) * maskedAmpliutude;
}

//GeoScaling High precision
float3 GeoScaling_hp(float3 objPos, float scale)
{ 
    float3 norm = normalize(objPos);
    return  norm * scale + objPos;
}

//GeoScaling Medium precision
half3 GeoScaling_mp(half4 objPos, half scale)
{ 
    half3 norm = normalize(objPos);
    return  norm * scale + objPos;
}
#endif

