#if !defined(MERLINDRAFTSMAN_INCLUDED)
#define MERLINMERLINDRAFTSMAN_INCLUDED

float4 DrawCirle(float2 uv, float2 pos, float rad, float3 col) 
{
	float d = length(pos - uv) - rad;
	float t = clamp(d, 0.0, 1.1);
	return float4(col, 1.0 - t);
}

fixed DrawCircle_lp(fixed2 uvPos, fixed innerRadius, fixed outerRadius)
{
	fixed outer = 1 - step(outerRadius, sqrt(dot(uvPos, uvPos)));
	fixed inner = step(innerRadius, sqrt(dot(uvPos, uvPos)));
	return inner * outer;
}

float DrawCircleBlured(float2 p, float b, float r)
{
	float dist = sqrt(dot(p, p));
	return  1.0 + smoothstep(r, r + b, dist) - smoothstep(r - b, r, dist);
}

float DrawDisc(float2 p, float r)
{
	return 1 - step(r, sqrt(dot(p, p)));
	//return step(r*2, sqrt(dot(p, p)));
}

fixed DrawDisc_lp(fixed2 p, fixed r)
{
	return 1 - step(r, sqrt(dot(p, p)));
}


float DrawDiscBlur(float2 p, float b, float r)
{
	return smoothstep(r + b, r - b, sqrt(dot(p, p)));
	//return step(r*2, sqrt(dot(p, p)));
}

#endif