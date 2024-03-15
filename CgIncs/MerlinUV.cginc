#if !defined(MERLINUV_INCLUDED)
#define MERLINUV_INCLUDED

float2 RotateUV_hp(float2 uv, float degrees)
{
	float2 pivot = float2(0.5, 0.5);
	float cosAngle = cos(degrees);
	float sinAngle = sin(degrees);
	float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
	float2 rotatedUv = mul(rot, uv - pivot);
	return rotatedUv += pivot;
}


half2 RotateUV_mp(half2 uv, half degrees)
{
	half2 pivot = half2(0.5, 0.5);
	half cosAngle = cos(degrees);
	half sinAngle = sin(degrees);
	half2x2 rot = half2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
	half2 rotatedUv = mul(rot, uv - pivot);
	return rotatedUv += pivot;
}


float2 RotateUVpivot_hp(float2 uv, float degrees, float2 pivot)
{
	float cosAngle = cos(degrees);
	float sinAngle = sin(degrees);
	float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
	float2 rotatedUv = mul(rot, uv - pivot);
	return rotatedUv += pivot;
}


half2 RotateUVpivot_mp(half2 uv, half degrees, half2 pivot)
{
	half cosAngle = cos(degrees);
	half sinAngle = sin(degrees);
	half2x2 rot = half2x2(cosAngle, -sinAngle, sinAngle, cosAngle);
	half2 rotatedUv = mul(rot, uv - pivot);
	return rotatedUv += pivot;
}


float2 OffsetUVlinear_hp(float2 uv, float2 axisMask, float speed) 
{
	return uv + ((_Time.y * axisMask * speed) % 2);
}


half2 OffsetUVlinear_mp(half2 uv, half2 axisMask, half speed)
{
	return uv + ((_Time.y * axisMask * speed) /*% 2*/);
}


float2 OffsetUVplussed_hp(float2 uv, float2 axisMask, float offset)
{
    return uv + (axisMask * offset);
}


half2 OffsetUVplussed_mp(half2 uv, half2 axisMask, half offset)
{
    return uv + (axisMask * offset);
}


float2 SinUV_hp(float2 uv, float2 axisMask, float frequency, float amplitude)
{
	float2 maskedFrequency = axisMask * frequency;
	float2 maskedAmpliutude = axisMask * amplitude;
	return sin(uv * maskedFrequency + _Time.y) * maskedAmpliutude;
}


half2 SinUV_mp(half2 uv, half2 axisMask, half frequency, half amplitude)
{
	half2 maskedFrequency = axisMask * frequency;
	half2 maskedAmpliutude = axisMask * amplitude;
	return sin(uv * maskedFrequency + _Time.y) * maskedAmpliutude;
}


float2 GetCellUV_hp(float3 vertex, float3 normal)
{
	float3 Pos = normalize(GetWorldSpaceViewDir(vertex.xyz));
	float3 Norm = normalize(mul(mul(UNITY_MATRIX_V, unity_ObjectToWorld), float4(normal, 0.0)));
	float3 Refl = reflect(Pos, Norm);
	float Mapping = 2.0 * sqrt(
		pow(Refl.x, 2.0) +
		pow(Refl.y, 2.0) +
		pow(Refl.z + 1, 2.0));
	return Refl.xy / Mapping + .5;
}


half2 GetCellUV_mp(half3 vertex, half3 normal)
{
	half3 Pos = normalize(GetWorldSpaceViewDir(vertex.xyz));
	half3 Norm = normalize(mul(mul(UNITY_MATRIX_V, unity_ObjectToWorld), half4(normal, 0.0)));
	half3 Refl = reflect(Pos, Norm);
	half Mapping = 2.0 * sqrt(
		pow(Refl.x, 2.0) +
		pow(Refl.y, 2.0) +
		pow(Refl.z + 1, 2.0));
	return Refl.xy / Mapping + .5;
}


float2 GetScreenSpace_hp(float4 vertpos, float2 scale)
{
    float screenUvX = vertpos.x / vertpos.w * scale.x;
    float screenUvY = vertpos.y / vertpos.w * scale.y; 
    return float2(screenUvX, screenUvY);
}

half2 GetScreenSpace_mp(half4 vertpos, half2 scale)
{
    half screenUvX = vertpos.x / vertpos.w * scale.x;
    half screenUvY = vertpos.y / vertpos.w * scale.y; 
    return half2(screenUvX, screenUvY);
}

#endif