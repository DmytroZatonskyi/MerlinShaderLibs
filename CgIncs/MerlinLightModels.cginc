#if !defined(MERLINLIGHTMODELS_INCLUDED)
#define MERLINLIGHTMODELS_INCLUDED


//Lambert
float HalfLamber_hp(float2 uv, float2 axisMask, float3 viewDir, float height)
{
	//float2 p = viewDir.xy / viewDir.z * height;
	//float2 pMasked = p * axisMask;
	//float2 offset = uv - pMasked;
	//return float2 (offset.x, offset.y);
}

//Difuse
float Diffuse_hp(float4 objPos, float3 objNormal, float3 lightPos, float lightRadius)
{
    float3 worldPos = mul(unity_ObjectToWorld, objPos);
    half3 worldNormal = UnityObjectToWorldNormal(objNormal);
    
    float3 lightDifference = worldPos - lightPos;
    half3 lightDir = normalize(lightDifference);
    fixed intensity = saturate(-1 * dot(lightDir, worldNormal));
    float distanceSqr = max(dot(lightDifference /  -lightRadius, lightDifference / -lightRadius), 0.00001);
    intensity /= distanceSqr;
    
    return intensity;
}

#endif