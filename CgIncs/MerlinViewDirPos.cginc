#if !defined(MERLINViEWDIRPOS_INCLUDED)
#define MERLINViEWDIRPOS_INCLUDED

//Get Paralax
float2 ParallaxMapping_hp(float2 uv, float2 axisMask, float3 viewDir, float height)
{
	float2 p = viewDir.xy / viewDir.z * height;
	float2 pMasked = p * axisMask;
	float2 offset = uv - pMasked;
	return float2 (offset.x, offset.y);
}

half2 ParallaxMapping_mp(half2 uv, half2 axisMask, half3 viewDir, half height)
{
	half2 p = viewDir.xy / viewDir.z * height;
	half2 pMasked = p * axisMask;
	half2 offset = uv - pMasked;
	return half2 (offset.x, offset.y);
}

//Fresnel
float3 Fresnel_hp(float3 objPos, float3 viewDir, float power)
{
    float3 norm = normalize(objPos);
    float3 normDir = normalize(viewDir);
    float dotProd = dot(norm, normDir);
    float satur = saturate(dotProd);
    return pow(1 - satur, power);
}

half3 Fresnel_mp(half3 objPos, half3 viewDir, half power)
{
    half3 norm = normalize(objPos);
    half3 normDir = normalize(viewDir);
    half dotProd = dot(norm, normDir);
    half satur = saturate(dotProd);
    return pow(1 - satur, power);
}
#endif