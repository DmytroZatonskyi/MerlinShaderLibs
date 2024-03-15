#if !defined(MERLINMATHOPS_INCLUDED)
#define MERLINMATHOPS_INCLUDED

#include "Assets/Shaders/CgIncs/Constants.cginc"
fixed DegToRadsVec1_lp(fixed degrees) { return (PI * degrees)/180; }

fixed Remap_lp(fixed value, fixed from1, fixed to1, fixed from2, fixed to2) 
{
    return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
}

//TODO vector multiplication and division by components

#endif
